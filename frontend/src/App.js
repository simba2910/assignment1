import React, { useState, useEffect } from 'react';
import './App.css';
import axios from 'axios';

function App() {
  const [students, setStudents] = useState([]);
  const [subjects, setSubjects] = useState([]);
  const [nodeId, setNodeId] = useState('');

  useEffect(() => {
    // Get the node ID from response headers
    axios.get('http://localhost:5000/api/node')
      .then(response => {
        setNodeId(response.headers['x-node-id'] || 'unknown');
      });
  }, []);

  const fetchStudents = () => {
    console.log('Fetching students from: http://localhost:5000/students');
    axios.get('http://localhost:5000/students')
      .then(response => setStudents(response.data))
      .catch(error => console.error('Error fetching students:', error));
  };

  // const fetchSubjects = () => {
  // console.log('Fetching subjects from: http://localhost:5000/subjects');
  // axios.get('http://localhost:5000/subjects')
  //   .then(response => setSubjects(response.data))
  //   .catch(error => console.error('Error fetching subjects:', error));
  // };

  const fetchSubjects = () => {
    console.log('Fetching subjects from: http://localhost:5000/subjects');
    axios.get('http://localhost:5000/subjects')
      .then(response => {
        // Log the response to verify the structure
        console.log('Subjects response:', response.data);

        // Update the subjects state with the response data
        setSubjects(response.data);
      })
      .catch(error => console.error('Error fetching subjects:', error));
  };
  return (
    <div className="App">
      <header>
        <h1>University Portal</h1>
        <p>Served by: {nodeId}</p>
      </header>

      <div className="buttons">
        <button onClick={fetchStudents}>Students</button>
        <button onClick={fetchSubjects}>Courses</button>
      </div>

      <div className="data-container">
        {students.length > 0 && (
          <>
            <h2>Students List</h2>
            <ul>
              {students.map(student => (
                <li key={student.id}>{student.name} - {student.program}</li>
              ))}
            </ul>
          </>
        )}



        {subjects && Object.keys(subjects).length > 0 && (
          <>
            <h2>Software Engineering Courses</h2>
            {Object.keys(subjects).map(year => (
              <div key={year}>
                <h3>{year}</h3>
                <ul>
                  {subjects[year].map((subject, index) => (
                    <li key={index}>{subject}</li>
                  ))}
                </ul>
              </div>
            ))}
          </>
        )}
      </div>
    </div>
  );
}

export default App;