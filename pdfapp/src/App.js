// Copyright 2017 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import React, { useState } from 'react';
import FileUploader from './fileuploader';

const App = () => {
  const [extractedText, setExtractedText] = useState(''); // Store extracted text here

  const handleFileSubmit = async (file) => {
    // Upload progress tracking (optional)
    console.log('Uploading file...');

    // Prepare data for API request
    const formData = new FormData();
    formData.append('file', file);

    // Upload file to backend endpoint
    const response = await fetch('/api/upload', {
      method: 'POST',
      body: formData,
    });

    // Check for upload errors
    if (!response.ok) {
      console.error('Error uploading file:', await response.text());
      return;
    }

    // Get destination URI for extracted text
    const { destinationUri } = await response.json();

    // Fetch extracted text from Cloud Vision API
    const textResponse = await fetch(destinationUri);
    const extractedData = await textResponse.json();

    // Update state with extracted text
    setExtractedText(extractedData.responses[0].fullTextAnnotation.text);

    // Display extracted text (update your component logic here)
    console.log('Extracted text:', extractedText);
    // ...
    // Extract text directly from JSON response
//const extractedData = await response.json();
const extractedText = extractedData.extracted_text;

// Update state and display text
setExtractedText(extractedText);
console.log('Extracted text:', extractedText);
// ...
  };

  return (
    <div>
      <FileUploader onSubmit={handleFileSubmit} />
      {extractedText && <p>Extracted Text: {extractedText}</p>}
    </div>
  );
};

export default App;
