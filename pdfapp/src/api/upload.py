# After text extraction using Cloud Vision API
extracted_text = ...  # Your extracted text data

# Modify response to include extracted text as JSON
response_data = {
    "extracted_text": extracted_text,
}

return json.dumps(response_data)
