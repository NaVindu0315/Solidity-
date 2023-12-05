// FileUploader.js

import React, { useState } from 'react';

const FileUploader = () => {
  const [file, setFile] = useState(null);

  const handleFileChange = (event) => {
    setFile(event.target.files[0]);
  };

  const uploadFile = (file) => {
    // Prepare file data
    const formData = new FormData();
    formData.append('file', file);

    // Send upload request to backend API
    fetch('/api/upload', {
      method: 'POST',
      body: formData,
    }).then((response) => {
      // Handle success or error based on response
    });
  };

  return (
    <div>
      <input type="file" onChange={handleFileChange} />
      <button onClick={() => uploadFile(file)}>Upload</button>
      {file && <p>Selected file: {file.name}</p>}
    </div>
  );
};

export default FileUploader;
