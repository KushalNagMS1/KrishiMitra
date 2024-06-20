from flask import Flask, render_template, redirect, url_for,request,session, jsonify, Response
import uuid
import subprocess
from reportlab.lib import colors
from reportlab.lib.pagesizes import letter
from reportlab.platypus import Table, TableStyle, Spacer, Image, Paragraph, PageTemplate, Frame,BaseDocTemplate
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from mysql.connector import connect
import hashlib


app = Flask(__name__)
app.secret_key = 'your_secret_key_here'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'krishimitra'


# Function to get MySQL connection
def get_mysql_connection():
    return connect(
        host=app.config['MYSQL_HOST'],
        user=app.config['MYSQL_USER'],
        password=app.config['MYSQL_PASSWORD'],
        database=app.config['MYSQL_DB']
    )


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        hashed_password = hashlib.sha256(password.encode()).hexdigest()
        try:
            connection = get_mysql_connection()
            cur = connection.cursor()
            cur.execute("SELECT * FROM users WHERE username = %s AND password = %s", (username, hashed_password))
            user = cur.fetchone()
            cur.execute("SELECT * FROM _admin_ WHERE admminname = %s AND adminpassword = %s", (username, password))
            admin = cur.fetchone()
            cur.close()
            connection.close()
            if user:
                session['username'] = username
                return redirect(url_for('dashboard'))
            elif admin:
                mysql_workbench_path = 'C:\Program Files\MySQL\MySQL Workbench 8.0\MySQLWorkbench.exe'
                subprocess.Popen([mysql_workbench_path])
                return """
                        <script type="text/javascript">
                            window.close();
                        </script>
                    """
            else :
                alert_message="Invalid Login Credentials"
                return render_template('login.html', alert_message=alert_message)
        except AttributeError as e:
            # Handle AttributeError here, for example, by logging the error
            alert_message = "DataBase Connection is not established"
            return render_template('login.html', alert_message=alert_message)
    return render_template('login.html')


@app.route('/dashboard',methods=['GET','POST'])
def dashboard():
    if 'username' in session:
        username = session['username']
        connection = get_mysql_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT username FROM users WHERE username = %s", (username,))
        data = cursor.fetchone()
        cursor.close()
        connection.close()
        return render_template('dashboard.html', username=data[0])  # Pass username to the template
    else:
        return redirect(url_for('login'))


@app.route('/user', methods=['GET'])
def user():
    username = session['username']
    connection = get_mysql_connection()
    cur = connection.cursor()
    cur.execute("SELECT * FROM users WHERE username = %s", (username,))
    user = cur.fetchone()
    cur.close()
    connection.close()
    return render_template('user.html')


@app.route('/update_user', methods=['POST'])
def update_user():
    if 'username' in session:
        username = session['username']
        connection = get_mysql_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT username FROM users WHERE username = %s", (username,))
        data = cursor.fetchone()
        new_username = request.form['username']
        new_email = request.form['email']
        new_password = request.form['password']
        hashed_password = hashlib.sha256(new_password.encode()).hexdigest()
        cursor.close()
        connection.close()
        connection = get_mysql_connection()
        cur = connection.cursor()
        # Check if the new username already exists
        cur.execute("SELECT username FROM users WHERE username = %s", (new_username,))
        existing_user = cur.fetchone()
        
        if existing_user == None :
            cur.execute("UPDATE users SET username = %s, password = %s, email = %s WHERE username = %s", (new_username, hashed_password, new_email, session['username']))
            cur.execute("UPDATE user_records SET username = %s WHERE username = %s", (new_username, session['username']))
            connection.commit()
            cur.close()
            connection.close()
            session['username'] = new_username  # Update session with new username
            alert='User information updated successfully.'
            return render_template('user.html', alert=alert)
        elif new_username == existing_user[0]:
            cur.close()
            connection.close()
            alert='Username already exists. Please choose a different username.'
            return render_template('user.html', alert=alert)  # Redirect back to the user page


@app.route('/submit_form', methods=['POST'])
def submit_form():
    if request.method == 'POST':
        session_id = str(uuid.uuid4())
        record_name = request.form.get('recordName')
        connection = get_mysql_connection()
        cursor = connection.cursor()
        username = session['username']
        cursor.execute("SELECT username FROM users WHERE username = %s", (username,))
        data = cursor.fetchone()[0]
        cursor.execute("INSERT INTO user_records (session_id, username,record_name) VALUES (%s, %s, %s)", (session_id, data, record_name))
        connection.commit()
        cursor.close()
        connection.close()
        session['session_id'] = session_id
        return redirect(url_for('region'))


@app.route('/region')
def region(): 
    connection = get_mysql_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT region_name FROM region")
    regions = cursor.fetchall()
    cursor.close()
    connection.close()
    region_names = [region[0] for region in regions]
    return render_template('region.html', regions=region_names)


@app.route('/get_region')
def get_region():
    session_id = session['session_id'] 
    region_name = request.args.get('regionName')
    if not region_name:
        return jsonify({'success': False, 'message': 'Please select a region.'})
    connection = get_mysql_connection()
    cursor = connection.cursor()
    cursor.execute("UPDATE user_records SET region = %s WHERE session_id = %s", (region_name, session_id))
    connection.commit()
    cursor.close()
    connection.close()
    return "Region '{}' stored successfully in the database.".format(region_name)


@app.route('/soil')
def soil():
    session_id = session['session_id'] 
    connection = get_mysql_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT soil_type FROM region_soil WHERE region_name IN (SELECT region FROM user_records WHERE session_id = %s)", (session_id,))
    soil_data = cursor.fetchone()[(0)]
    print(soil_data[0])
    cursor.execute("SELECT region_name FROM region_soil WHERE region_name IN (SELECT region FROM user_records WHERE session_id = %s)", (session_id,))
    region_data = cursor.fetchone()[(0)]
    cursor.execute("UPDATE user_records SET soil = %s WHERE session_id = %s", (soil_data, session_id))
    connection.commit()
    cursor.execute("SELECT cost_per_unit_area FROM region WHERE region_name = %s", (region_data,))
    cost_data = cursor.fetchall()
    cursor.execute("SELECT water_source FROM region_water WHERE region_name = %s", (region_data,))
    water_data = cursor.fetchall()
    cursor.execute("SELECT nutrients FROM soil_nutrition WHERE soil_type = %s", (soil_data,))
    nutrients_data = cursor.fetchall()
    cursor.execute("SELECT water_holding_capacity FROM soil WHERE soil_type = %s", (soil_data,))
    water_cap = cursor.fetchall()
    cursor.close()
    connection.close()
    return render_template('soil.html', soil_data=soil_data,region_data=region_data,cost_data=cost_data[0],water_data=water_data[0],water=water_data[1], soil1=nutrients_data[0],soil2=nutrients_data[1], soil3=nutrients_data[2],water_cap=water_cap[0])


@app.route('/store_month', methods=['POST'])
def store_month():
    session_id = session['session_id'] 
    selected_month = request.form['month']
    connection = get_mysql_connection()
    cursor = connection.cursor()
    cursor.execute("UPDATE user_records SET month_ = %s WHERE session_id = %s", (selected_month, session_id))
    connection.commit()
    cursor.close()
    connection.close()
    return "Month '{}' stored successfully in the database.".format(selected_month)


@app.route('/crop_search')
def crop_search():
        session_id = session['session_id'] 
        connection = get_mysql_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT crop_name FROM crop_all_month WHERE (sowing_month, soil_type) IN (SELECT month_, soil FROM user_records WHERE session_id = %s)", (session_id,))
        crop_name = cursor.fetchone()[(0)]
        cursor.execute("UPDATE user_records SET crop = %s WHERE session_id = %s ", (crop_name, session_id,))
        connection.commit()
        cursor.execute("SELECT * FROM crop_properties WHERE crop_name = %s", (crop_name,))
        crop_prop = cursor.fetchall()
        cursor.close()
        connection.close()
        return render_template('crop_search.html', crop_name=crop_name, crop_prop=crop_prop)


@app.route('/crop')
def crop():
    session_id = session['session_id'] 
    connection = get_mysql_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT crop FROM user_records WHERE session_id = %s", (session_id,))
    crop = cursor.fetchone()
    if crop:
        crop = crop[0]
        cursor.execute("SELECT * FROM crop_diseases WHERE crop_name = %s", (crop,))
        crop_dis = cursor.fetchall()
        cursor.execute("SELECT * FROM crop_properties WHERE crop_name = %s", (crop,))
        crop_pro = cursor.fetchall()
        cursor.execute("SELECT * FROM crop_economics WHERE crop_name = %s", (crop,))
        crop_eco = cursor.fetchall()
        cursor.execute("SELECT * FROM crop_pests_pesticides WHERE crop_name = %s", (crop,))
        crop_pes = cursor.fetchall()
        cursor.execute("SELECT medicine FROM crop_medicines WHERE diseases IN (SELECT diseases FROM crop_diseases WHERE crop_name = %s)", (crop,))
        crop_med = cursor.fetchall()
        cursor.close()
        connection.close()
        return render_template('crop.html', crop=crop, crop_dis=crop_dis, crop_pro=crop_pro, crop_eco=crop_eco,
                                crop_pes=crop_pes,crop_med=crop_med[0])
    

@app.route('/report')
def report():
    username = session['username'] 
    connection = get_mysql_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM user_records where username = %s", (username,))
    data = cursor.fetchall()
    cursor.close()
    connection.close()
    return render_template('report.html',data=data)


@app.route('/update_record', methods=['POST'])
def update_record():
    new_name = request.form['new_name']
    record_id = request.form['record_id']
    try:
        # Update record name in the database
        connection = get_mysql_connection()
        cursor = connection.cursor()
        query = "UPDATE user_records SET record_name = %s WHERE session_id = %s"
        cursor.execute(query, (new_name, record_id))
        connection.commit()
        cursor.close()
        connection.close()
        return redirect(url_for('report'))
    except Exception as e:
        return "Error updating record name: " + str(e)


@app.route('/delete_record', methods=['POST'])
def delete_record():
    delete_id = request.form['delete_id']
    try:
        # Update record name in the database
        connection = get_mysql_connection()
        cursor = connection.cursor()
        cursor.execute("DELETE FROM user_records WHERE session_id = %s",(delete_id,))
        connection.commit()
        cursor.close()
        connection.close()
        return redirect(url_for('report'))
    except Exception as e:
        return "Error updating record name: " + str(e)


def add_border(canvas, doc):
    # Draw border on every page
    canvas.saveState()
    canvas.setStrokeColor(colors.green)
    canvas.setLineWidth(2)
    canvas.rect(40, 40, doc.width + 60, doc.height + 60)
    canvas.restoreState()

class BorderedDocTemplate(BaseDocTemplate):
    def __init__(self, filename, **kwargs):
        BaseDocTemplate.__init__(self, filename, **kwargs)
        self.addPageTemplates(PageTemplate(id='border', frames=Frame(40, 40, self.width+60, self.height+60), onPage=add_border))


def generate_pdf(crop,crop_dis,crop_pro,crop_eco,crop_pes,crop_med,soil_data,region_data,cost_data,water_data,nutrients_data,water_cap,user,record_name,month):
    filename = f"{crop}.pdf"
    
    doc = BorderedDocTemplate(filename, pagesize=letter)

    elements = []

    # Add title to PDF
    title_style = ParagraphStyle(name=f"KrishiMitra", fontSize=25, textColor=colors.green, alignment=1)
    title = Paragraph(f"KrishiMitra", title_style)
    elements.append(title)

    elements.append(Spacer(1, 20))
    elements.append(Spacer(1, 20))
    elements.append(Spacer(1, 20))

    # Add title to PDF
    title_style = ParagraphStyle(name=f"User Name : {user}", fontSize=16, textColor=colors.black, alignment=0)
    title = Paragraph(f"User Name : {user}", title_style)
    elements.append(title)

    elements.append(Spacer(1, 20))

    title_style = ParagraphStyle(name=f"Record Name : {record_name}", fontSize=16, textColor=colors.black, alignment=0)
    title = Paragraph(f"Record Name : {record_name}", title_style)
    elements.append(title)

    elements.append(Spacer(1, 20))

    title_style = ParagraphStyle(name=f"Sowing Month : {month}", fontSize=16, textColor=colors.black, alignment=0)
    title = Paragraph(f"Sowing Month : {month}", title_style)
    elements.append(title)

    # Add space between image/title and table
    elements.append(Spacer(1, 20))

    elements.append(Spacer(1, 20))

    region_pic = f"static/region/{region_data}.jpg"
    region_img = Image(region_pic, width=2*inch, height=1.5*inch)

    soil_pic = f"static/soil/{soil_data}.jpg"
    soil_img = Image(soil_pic, width=2*inch, height=1.5*inch)

    pic_path = f"static/crop_search/{crop}.jpg"

    crop_img = Image(pic_path, width=2*inch, height=1.5*inch)

    pics = [["Region","Soil","Crop"],[region_data, soil_data, crop],[None,None,None]]

    pics[2][0] = region_img 
    pics[2][1] = soil_img 
    pics[2][2] = crop_img

    pic_table = Table(pics)

    # Apply styles to the table if needed
    pic_table.setStyle(TableStyle([
    ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
    ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
    ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
    ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
    ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
    ('BACKGROUND', (0, 1), (-1, -1), colors.beige),
    ('GRID', (0, 0), (-1, -1), 1, colors.black)]))

    elements.append(pic_table)

    elements.append(Spacer(1, 20))

    heading_style = ParagraphStyle(name="Details", fontSize=16, textColor=colors.black, alignment=0)
    heading = Paragraph("Details", heading_style)
    elements.append(heading)

    elements.append(Spacer(1, 20))

    styles = getSampleStyleSheet()
    for cost in cost_data:
        paragraph1 = Paragraph( cost[0], styles["Normal"])

    for water in water_data:
        paragraph2 = Paragraph( water[0], styles["Normal"])

    for wate in water_cap:
        paragraph3 = Paragraph( wate[0], styles["Normal"])

    for soil_n in nutrients_data:
        paragraph4 = Paragraph( soil_n[0], styles["Normal"])

    # Convert paragraph to table
    paragraph_table = Table([[paragraph1]])
    paragraph_table = Table([[paragraph2]])
    paragraph_table = Table([[paragraph3]])
    paragraph_table = Table([[paragraph4]])

    table_data7 = [["Cost per unit area",paragraph1],["Water Source",paragraph2],["Soil Water Holding Capacity",paragraph3],["Nutrients",paragraph4]]
    table7 = Table(table_data7)
    table7.setStyle(TableStyle([('BACKGROUND', (0, 0), (-1, 0), colors.beige),
                                ('TEXTCOLOR', (0, 0), (-1, 0), colors.black),
                                ('ALIGN', (0, 0), (-1, -1), 'CENTER'),('FONTNAME', (0, 0), (-1, 0), 'Helvetica'),
                                ('BOTTOMPADDING', (0, 0), (-1, 0), 12),('BACKGROUND', (0, 1), (-1, -1), colors.beige),
                                ('GRID', (0, 0), (-1, -1), 1, colors.black)]))
    
    elements.append(table7)


    table_data1 = [["Disease",paragraph_table]]
    
    # Add space between image/title and table
    elements.append(Spacer(1, 20))

    heading_style = ParagraphStyle(name="Crop Properties", fontSize=16, textColor=colors.black, alignment=0)
    heading = Paragraph("Crop Properties", heading_style)
    elements.append(heading)

    elements.append(Spacer(1, 20))

    styles = getSampleStyleSheet()
    for row in crop_pro:
        paragraph1 = Paragraph( row[1], styles["Normal"])
        paragraph2 = Paragraph( row[2], styles["Normal"])
        paragraph3 = Paragraph( row[3], styles["Normal"])
        paragraph4 = Paragraph( row[4], styles["Normal"])
        paragraph5 = Paragraph( row[5], styles["Normal"])

    # Convert paragraph to table
    paragraph_table = Table([[paragraph1]])
    paragraph_table = Table([[paragraph2]])
    paragraph_table = Table([[paragraph3]])
    paragraph_table = Table([[paragraph4]])
    paragraph_table = Table([[paragraph5]])

    table_data2 = [["Yield Type",paragraph1],["Harversting Month",paragraph2],["Life Span",paragraph3],["Water Requirement",paragraph4],["Irrigation Type",paragraph5]]
    table2 = Table(table_data2)
    table2.setStyle(TableStyle([('BACKGROUND', (0, 0), (-1, 0), colors.beige),
                               ('TEXTCOLOR', (0, 0), (-1, 0), colors.black),
                               ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                               ('FONTNAME', (0, 0), (-1, 0), 'Helvetica'),
                               ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
                               ('BACKGROUND', (0, 1), (-1, -1), colors.beige),
                               ('GRID', (0, 0), (-1, -1), 1, colors.black)]))
    
    elements.append(table2)

    # Add space between image/title and table
    elements.append(Spacer(1, 20))
    elements.append(Spacer(1, 20))
    elements.append(Spacer(1, 20))
    elements.append(Spacer(1, 20))
    elements.append(Spacer(1, 20))

    heading_style = ParagraphStyle(name="Crop Economics", fontSize=16, textColor=colors.black, alignment=0)
    heading = Paragraph("Crop Economics", heading_style)
    elements.append(heading)

    elements.append(Spacer(1, 20))

    styles = getSampleStyleSheet()
    for row in crop_eco:
        paragraph1 = Paragraph( row[1], styles["Normal"])
        paragraph2 = Paragraph( row[2], styles["Normal"])
        paragraph3 = Paragraph( row[3], styles["Normal"])

    # Convert paragraph to table
    paragraph_table = Table([[paragraph1]])
    paragraph_table = Table([[paragraph2]])
    paragraph_table = Table([[paragraph3]])

    table_data3 = [["Yield per unit area",paragraph1],["Cultivation cost per unit area",paragraph2],["Avgerage Market value per unit area",paragraph3]]
    table3 = Table(table_data3)
    table3.setStyle(TableStyle([('BACKGROUND', (0, 0), (-1, 0), colors.beige),
                               ('TEXTCOLOR', (0, 0), (-1, 0), colors.black),
                               ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                               ('FONTNAME', (0, 0), (-1, 0), 'Helvetica'),
                               ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
                               ('BACKGROUND', (0, 1), (-1, -1), colors.beige),
                               ('GRID', (0, 0), (-1, -1), 1, colors.black)]))
    
    elements.append(table3)

    # Add space between image/title and table
    elements.append(Spacer(1, 20))

    heading_style = ParagraphStyle(name="Crop Pest", fontSize=16, textColor=colors.black, alignment=0)
    heading = Paragraph("Crop Pest", heading_style)
    elements.append(heading)

    elements.append(Spacer(1, 20))

    styles = getSampleStyleSheet()
    for row in crop_pes:
        paragraph = Paragraph( row[0], styles["Normal"])

    # Convert paragraph to table
    paragraph_table = Table([[paragraph]])

    table_data4 = [["Pests",paragraph]]
    table4 = Table(table_data4)
    table4.setStyle(TableStyle([('BACKGROUND', (0, 0), (-1, 0), colors.beige),
                               ('TEXTCOLOR', (0, 0), (-1, 0), colors.black),
                               ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                               ('FONTNAME', (0, 0), (-1, 0), 'Helvetica'),
                               ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
                               ('BACKGROUND', (0, 1), (-1, -1), colors.beige),
                               ('GRID', (0, 0), (-1, -1), 1, colors.black)]))
    
    elements.append(table4)

    # Add space between image/title and table
    elements.append(Spacer(1, 20))

    heading_style = ParagraphStyle(name="Crop Diseases", fontSize=16, textColor=colors.black, alignment=0)
    heading = Paragraph("Crop Diseases", heading_style)
    elements.append(heading)

    elements.append(Spacer(1, 20))

    styles = getSampleStyleSheet()

    for row in crop_dis:
        paragraph = Paragraph( row[1], styles["Normal"])

    # Convert paragraph to table
    paragraph_table = Table([[paragraph]])

    table1 = Table(table_data1)
    table1.setStyle(TableStyle([('BACKGROUND', (0, 0), (-1, 0), colors.beige),
                               ('TEXTCOLOR', (0, 0), (-1, 0), colors.black),
                               ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                               ('FONTNAME', (0, 0), (-1, 0), 'Helvetica'),
                               ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
                               ('BACKGROUND', (0, 1), (-1, -1), colors.beige),
                               ('GRID', (0, 0), (-1, -1), 1, colors.black)]))
    
    elements.append(table1)

    elements.append(Spacer(1, 20))

    heading_style = ParagraphStyle(name="Crop Disease Treatement", fontSize=16, textColor=colors.black, alignment=0)
    heading = Paragraph("Crop Disease Treatment", heading_style)
    elements.append(heading)

    elements.append(Spacer(1, 20))

    styles = getSampleStyleSheet()
    for row in crop_med:
        paragraph = Paragraph( row[0] , styles["Normal"])

    # Convert paragraph to table
    paragraph_table = Table([[paragraph]])

    table_data5 = [["Medicine",paragraph]]
    table5 = Table(table_data5)
    table5.setStyle(TableStyle([('BACKGROUND', (0, 0), (-1, 0), colors.beige),
                               ('TEXTCOLOR', (0, 0), (-1, 0), colors.black),
                               ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                               ('FONTNAME', (0, 0), (-1, 0), 'Helvetica'),
                               ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
                               ('BACKGROUND', (0, 1), (-1, -1), colors.beige),
                               ('GRID', (0, 0), (-1, -1), 1, colors.black)]))
    
    elements.append(table5)

    # Add space between image/title and table
    elements.append(Spacer(1, 20))

    heading_style = ParagraphStyle(name="Crop Pesticides", fontSize=16, textColor=colors.black, alignment=0)
    heading = Paragraph("Crop Pesticides", heading_style)
    elements.append(heading)

    elements.append(Spacer(1, 20))

    styles = getSampleStyleSheet()
    for row in crop_pes:
        paragraph = Paragraph( row[2], styles["Normal"])

    # Convert paragraph to table
    paragraph_table = Table([[paragraph]])

    table_data6 = [["Pesticides",paragraph]]
    table6 = Table(table_data6)
    table6.setStyle(TableStyle([('BACKGROUND', (0, 0), (-1, 0), colors.beige),
                               ('TEXTCOLOR', (0, 0), (-1, 0), colors.black),
                               ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                               ('FONTNAME', (0, 0), (-1, 0), 'Helvetica'),
                               ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
                               ('BACKGROUND', (0, 1), (-1, -1), colors.beige),
                               ('GRID', (0, 0), (-1, -1), 1, colors.black)]))
    
    elements.append(table6)

    # Add space between image/title and table
    elements.append(Spacer(1, 20))

    # Build PDF
    doc.build(elements)
    return filename


@app.route('/download_pdf', methods=['GET'])
def download_pdf():
    session_id = request.args.get('session_id')

    # Fetch PDF content from MySQL based on session_id
    try:
        connection = get_mysql_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT crop FROM user_records WHERE session_id = %s", (session_id,))
        crop = cursor.fetchone()[0]
    except connection.Error as error:
        print("Error fetching PDF content:", error)
        return "Error fetching PDF content"
    cursor.execute("SELECT * FROM crop_diseases WHERE crop_name = %s", (crop,))
    crop_dis = cursor.fetchall()
    cursor.execute("SELECT * FROM crop_properties WHERE crop_name = %s", (crop,))
    crop_pro = cursor.fetchall()
    cursor.execute("SELECT * FROM crop_economics WHERE crop_name = %s", (crop,))
    crop_eco = cursor.fetchall()
    cursor.execute("SELECT * FROM crop_pests_pesticides WHERE crop_name = %s", (crop,))
    crop_pes = cursor.fetchall()
    cursor.execute("SELECT medicine FROM crop_medicines WHERE diseases IN (SELECT diseases FROM crop_diseases WHERE crop_name = %s)", (crop,))
    crop_med = cursor.fetchall()
    cursor.execute("SELECT soil_type FROM region_soil WHERE region_name IN (SELECT region FROM user_records WHERE session_id = %s)", (session_id,))
    soil_data = cursor.fetchone()[(0)]
    cursor.execute("SELECT region_name FROM region_soil WHERE region_name IN (SELECT region FROM user_records WHERE session_id = %s)", (session_id,))
    region_data = cursor.fetchone()[(0)]
    cursor.execute("SELECT cost_per_unit_area FROM region WHERE region_name = %s", (region_data,))
    cost_data = cursor.fetchall()
    cursor.execute("SELECT water_source FROM region_water WHERE region_name = %s", (region_data,))
    water_data = cursor.fetchall()
    cursor.execute("SELECT nutrients FROM soil_nutrition WHERE soil_type = %s", (soil_data,))
    nutrients_data = cursor.fetchall()
    cursor.execute("SELECT water_holding_capacity FROM soil WHERE soil_type = %s", (soil_data,))
    water_cap = cursor.fetchall()
    cursor.execute("SELECT username FROM user_records WHERE session_id = %s", (session_id,))
    user = cursor.fetchone()[0]
    cursor.execute("SELECT record_name FROM user_records WHERE session_id = %s", (session_id,))
    record_name = cursor.fetchone()[0]
    cursor.execute("SELECT month_ FROM user_records WHERE session_id = %s", (session_id,))
    month = cursor.fetchone()[0]
    cursor.close()
    connection.close()
    filename = generate_pdf(crop,crop_dis,crop_pro,crop_eco,crop_pes,crop_med,soil_data,region_data,cost_data,water_data,nutrients_data,water_cap,user,record_name,month)
    return Response(open(filename, 'rb'), mimetype='application/pdf', headers={'Content-Disposition': 'attachment; filename=KrishiMitra.pdf'})


@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect('/')


@app.route('/contact')
def contact():
    return render_template('contact.html')


@app.route('/signup',methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        try:
            username = request.form['username']
            email = request.form['email']
            password = request.form['password']
            hashed_password = hashlib.sha256(password.encode()).hexdigest()
            connection = get_mysql_connection()
            cur = connection.cursor()
            cur.execute("SELECT * FROM users WHERE username = %s", (username,))
            existing_user = cur.fetchone()
            if existing_user:
                error = 'Username already exists'
                return render_template('signup.html', error=error)
            else :
                cur.execute("INSERT INTO users (username, email, password) VALUES (%s, %s, %s)", (username, email, hashed_password))
                connection.commit()
                cur.close()
                connection.close()
                erro = 'User Created'
                return render_template('signup.html', erro=erro)
        except AttributeError as e:
            # Display an error message
            error = "Database connection is not established"
            return render_template('signup.html', error=error)
    return render_template('signup.html')


if __name__== "__main__":
    app.run(debug=True)
