import React, { useState, useEffect } from 'react';
import './App.css';
import axios from 'axios';

function App() {
  const [students, setStudents] = useState([]);
  const [subjects, setSubjects] = useState([]);
  const [nodeId, setNodeId] = useState('');

  useEffect(() => {
    // Get the node ID from response headers
    axios.get('/api/node')
      .then(response => {
        setNodeId(response.headers['x-node-id'] || 'unknown');
      });
  }, []);

  const fetchStudents = () => {
    axios.get('/api/students')
      .then(response => setStudents(response.data))
      .catch(error => console.error('Error:', error));
  };

  const fetchSubjects = () => {
    axios.get('/api/subjects')
      .then(response => setSubjects(response.data))
      .catch(error => console.error('Error:', error));
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

        {subjects.length > 0 && (
          <>
            <h2>Software Engineering Courses</h2>
            <ul>
              {subjects.map(subject => (
                <li key={subject.id}>{subject.name} - Year {subject.year}</li>
              ))}
            </ul>
          </>
        )}
      </div>
    </div>
  );
}

export default App;