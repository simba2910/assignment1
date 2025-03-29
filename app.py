from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///database.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# Database models
class Student(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    program = db.Column(db.String(100), nullable=False)

class Subject(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    year = db.Column(db.Integer, nullable=False)
    program = db.Column(db.String(100), nullable=False)

# Create database tables
with app.app_context():
    db.create_all()
    
    # Populate with sample data if empty
    if not Student.query.first():
        students = [
            Student(name="John Doe", program="Software Engineering"),
            Student(name="Jane Smith", program="Computer Science"),
            Student(name="Amina Johnson", program="Software Engineering"),
            Student(name="Fatuma Brown", program="Information Technology"),
            Student(name="Hussein Davis", program="Software Engineering"),
            Student(name="Chausiku Evans", program="Computer Science"),
            Student(name="Ethan Garcia", program="Software Engineering"),
            Student(name="Fiona Mpoki", program="Information Technology"),
            Student(name="George Russel", program="Software Engineering"),
            Student(name="Lewis Hamilton", program="Computer Science")
        ]
        db.session.add_all(students)
        
    if not Subject.query.first():
        subjects = [
            # Year 1
            Subject(name="Introduction to Programming", year=1, program="Software Engineering"),
            Subject(name="Discrete Mathematics", year=1, program="Software Engineering"),
            Subject(name="Linear Algebra", year=1, program="Software Engineering"),
            Subject(name="Communication Skills", year=1, program="Software Engineering"),
            Subject(name="Development Studies", year=1, program="Software Engineering"),
            Subject(name="Introcduction to IT", year=1, program="Software Engineering"),
            Subject(name="Calculus", year=1, program="Software Engineering"),
            Subject(name="Mathematical Foundations of IT Security", year=1, program="Software Engineering"),
            # Year 2
            Subject(name="Data Structures", year=2, program="Software Engineering"),
            Subject(name="System Design and Analysis", year=2, program="Software Engineering"),
            Subject(name="Database Systems", year=2, program="Software Engineering"),
            Subject(name="Computer Networking protocols", year=2, program="Software Engineering"),
            Subject(name="Computer Architecture", year=2, program="Software Engineering"),
            Subject(name="Operating Systems", year=2, program="Software Engineering"),
            Subject(name="ICT Research", year=2, program="Software Engineering"),
            Subject(name="Open Source technologies", year=2, program="Software Engineering"),
            # Year 3
            Subject(name="Selected topics in Software Engineering", year=3, program="Software Engineering"),
            Subject(name="Internet Programming", year=3, program="Software Engineering"),
            Subject(name="Computer Graphics", year=3, program="Software Engineering"),
            Subject(name="Data Mining", year=3, program="Software Engineering"),
            Subject(name="Advanced Java", year=3, program="Software Engineering"),
            Subject(name="Distributed Database", year=3, program="Software Engineering"),
            Subject(name="Mobile Apps", year=3, program="Software Engineering"),
            # Year 4
            Subject(name="Project Management", year=4, program="Software Engineering"),
            Subject(name="Distributed Systems", year=4, program="Software Engineering"),
            Subject(name="Software Deployment and Management", year=4, program="Software Engineering"),
            Subject(name="Big Data Analysis", year=4, program="Software Engineering"),
            Subject(name="Artificial Intelligence", year=4, program="Software Engineering"),
            Subject(name="Human Computer Interactions", year=4, program="Software Engineering"),
            Subject(name="Computer Maintenance", year=4, program="Software Engineering")
        ]
        db.session.add_all(subjects)
        
    db.session.commit()

# API Endpoints
@app.route('/students', methods=['GET'])
def get_students():
    students = Student.query.limit(10).all()
    return jsonify([{'name': s.name, 'program': s.program} for s in students])

@app.route('/subjects', methods=['GET'])
def get_subjects():
    subjects = Subject.query.filter_by(program="Software Engineering").order_by(Subject.year).all()
    result = {}
    for subject in subjects:
        if f"Year {subject.year}" not in result:
            result[f"Year {subject.year}"] = []
        result[f"Year {subject.year}"].append(subject.name)
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True)