<h1 align="center">Welcome to ror-exploration 👋</h1>

<p>
  This is a collection of RESTful APIs built using Ruby on Rails, providing endpoints for managing employees and their contacts.
</p>

## Features

- Create, Read, Update, and Delete (CRUD) operations for managing employees and contacts.
- Pagination support for listing employees.
- Validations for ensuring data integrity, such as unique NIK and valid gender values.
- Error handling with clear error messages for better user feedback.
- API endpoints for retrieving contacts associated with a specific employee.

## Installation

1. Clone the repository:
```bash
git clone https://github.com/your_username/your_repository.git
```

2. Install dependencies:
```bash
cd your_repository
bundle install
```

3. Set up the database:
```bash
rake db:create
rake db:migrate
```

4. Start the Rails server:
```bash
bin/rails server
```

## API Endpoints
### Employees
- GET /api/v1/employees: List all employees, including the pagination.
- GET /api/v1/employees/:id: Show details of a specific employee.
- POST /api/v1/employees: Create a new employee.
- PATCH /api/v1/employees/:id: Update an existing employee (with restrictions).
- DELETE /api/v1/employees/:id: Delete an employee.
### Contacts
- GET /api/v1/employees: List all contacts.
- GET /api/v1/contacts?employee_id=:employee_id: List contacts associated with a specific employee.
- POST /api/v1/contacts: Create a new contact.
- PATCH /api/v1/contacts/:id: Update an existing contact.
- DELETE /api/v1/contacts/:id: Delete a contact.

## Usage
### Employees
1. Index Endpoint
The "Index" endpoint is used to retrieve a list of all employees with pagination support. To use this endpoint, make a GET request to the following URL:
```bash
GET /api/v1/employees
```

Optional Parameters:
- page: The page number to retrieve (default is 1).
- per_page: The number of employees per page (default is 10).

Example Request:
```bash
GET /api/v1/employees?page=2&per_page=5
```

Example Response:
```json
{
  "employees": [
    {
      "id": 1,
      "nik": "9710584542462636",
      "name": "Jamal Jamali",
      "gender": "female",
      "birth_place": "Tangerang",
      "birth_date": "2003-07-15",
      "ktp_address": "Jl. Palem Kuning Blok E No. 21",
      "domisili": "Jawa Barat",
      "religion": "Islam",
      "marital_status": "Menikah"
    },
    // Additional employee objects...
  ],
  "meta": {
    "current_page": 2,
    "per_page": 5,
    "total_pages": 2,
    "total_count": 7
  }  
}
```
#### Explanation:
- The employees key contains an array of employee objects based on the requested page and per_page.
- The meta key provides pagination information:
    - current_page: The current page number (in this example, page 2).
    - per_page: The number of employees per page (in this example, 5).
    - total_pages: The total number of pages available (in this example, 2).
    - total_count: The total number of employees in the database (in this example, 7).

2. Show Endpoint
The "Show" endpoint is used to retrieve details of a specific employee by their ID. To use this endpoint, make a GET request to the following URL:
```bash
GET /api/v1/employees/:id
```

Example Request:
```bash
GET /api/v1/employees/1
```

Example Response (if the employee exists):
```json
{
  "id": 1,
  "nik": "9710584542462636",
  "name": "Jamal Jamali",
  "gender": "female",
  "birth_place": "Tangerang",
  "birth_date": "2003-07-15",
  "ktp_address": "Jl. Palem Kuning Blok E No. 21",
  "domisili": "Jawa Barat",
  "religion": "Islam",
  "marital_status": "Menikah"
}
```

Example Response (if the employee does not exist):
```json
{
  "error": "Employee not found..."
}
```

#### Explanation:
- The response includes all the details of the requested employee if found.
- If the employee does not exist, the response will contain an "error" key with the corresponding error message.

3. Create Endpoint
The "Create" endpoint is used to add a new employee to the database. To use this endpoint, make a POST request to the following URL:
```bash
POST /api/v1/employees
```

Request body:
```json
{
  "employee": {
    "nik": "1234567890123456",
    "name": "John Doe",
    "gender": "male",
    "birth_place": "New York",
    "birth_date": "1990-05-20",
    "ktp_address": "123 Main St",
    "domisili": "California",
    "religion": "Christian",
    "marital_status": "Single"
  }
}
```
Example Response (if the employee is successfully created):
```json
{
  "id": 8,
  "nik": "1234567890123456",
  "name": "John Doe",
  "gender": "male",
  "birth_place": "New York",
  "birth_date": "1990-05-20",
  "ktp_address": "123 Main St",
  "domisili": "California",
  "religion": "Christian",
  "marital_status": "Single"
}
```

Example Response (if there are validation errors):
```bash
{
  "error": "Validation failed: Nik is too short (minimum is 16 characters)"
}
```

#### Explanation:
- The request body contains the necessary information for creating a new employee.
- If the employee is successfully created, the response includes the details of the newly created employee with the assigned id.
- If there are validation errors (e.g., invalid nik), the response will contain an "error" key with the corresponding error message.

4. Update Endpoint
The "Update" endpoint is used to update specific attributes of an existing employee. However, it only allows updating the domisili and marital_status attributes. To use this endpoint, make a PATCH request to the following URL:
```bash
PATCH /api/v1/employees/:id
```

Request Body:
```json
{
    "domisili": "Texas",
    "marital_status": "Married"
}
```

Example Response (if the employee is successfully updated):
```json
{
  "id": 8,
  "nik": "1234567890123456",
  "name": "John Doe",
  "gender": "male",
  "birth_place": "New York",
  "birth_date": "1990-05-20",
  "ktp_address": "123 Main St",
  "domisili": "Texas",
  "religion": "Christian",
  "marital_status": "Married"
}
```

Example Response (if there are validation errors):
```json
{
  "error": "Validation failed: Domisili can't be blank"
}
```
#### Explanation:
- The request body contains the specific attributes to be updated for the employee identified by the given :id.
- If the employee is successfully updated, the response includes the updated details of the employee.
- If there are validation errors (e.g., missing domisili), the response will contain an "error" key with the corresponding error message.


### Contacts
1. Index Endpoint
The "Index" endpoint is used to retrieve a list of all contacts. To use this endpoint, make a GET request to the following URL:
```bash
GET /api/v1/contacts
```

Example Request:
```bash
GET /api/v1/contacts
```

Example Response:
```json
[
  {
    "contact_id": 1,
    "employee_id": "1",
    "phone": "1234567890",
    "email": "john.doe@example.com",
    "npwp": "1234567890",
    "bpjs_kesehatan": "1234567890",
    "bpjs_ketenagakerjaan": "1234567890"
  },
  // Additional contact objects...
]
```

1. Show Endpoint
The "Show" endpoint is used to retrieve details of a specific contact by its ID. To use this endpoint, make a GET request to the following URL:
```bash
GET /api/v1/contacts/:id
```

Example Request:
```bash
GET /api/v1/contacts/1
```

Example Response (if the contact exists):
```json
{
  "contact_id": 1,
  "employee_id": "1",
  "phone": "1234567890",
  "email": "john.doe@example.com",
  "npwp": "1234567890",
  "bpjs_kesehatan": "1234567890",
  "bpjs_ketenagakerjaan": "1234567890"
}
```

Example Response (if the contact does not exist):
```json
{
  "error": "Contact not found..."
}
```

2. Create Endpoint
The "Create" endpoint is used to add a new contact to the database. To use this endpoint, make a POST request to the following URL:
```bash
POST /api/v1/contacts
```

Request Body:
```json
{
  "contact": {
    "employee_id": "1",
    "phone": "9876543210",
    "email": "jane.doe@example.com",
    "npwp": "0987654321",
    "bpjs_kesehatan": "5678901234",
    "bpjs_ketenagakerjaan": "4567890123"
  }
}
```

Example Response (if the contact is successfully created):
```json
{
  "contact_id": 8,
  "employee_id": "1",
  "phone": "9876543210",
  "email": "jane.doe@example.com",
  "npwp": "0987654321",
  "bpjs_kesehatan": "5678901234",
  "bpjs_ketenagakerjaan": "4567890123"
}
```

Example Response (if there are validation errors):
```json
{
  "error": "Validation failed: Employee can't be blank"
}
```

3. Update Endpoint
The "Update" endpoint is used to update specific attributes of an existing contact. To use this endpoint, make a PATCH request to the following URL:
```bash
PATCH /api/v1/contacts/:id
```

Request Body:
```json
{
  "contact": {
    "phone": "1112223333",
    "email": "updated.email@example.com"
  }
}
```

Example Response (if the contact is successfully updated):
```json
{
  "contact_id": 8,
  "employee_id": "1",
  "phone": "1112223333",
  "email": "updated.email@example.com",
  "npwp": "0987654321",
  "bpjs_kesehatan": "5678901234",
  "bpjs_ketenagakerjaan": "4567890123"
}
```

Example Response (if there are validation errors):
```json
{
  "error": "Validation failed: Email is invalid"
}
```

4. Delete Endpoint
The "Delete" endpoint is used to delete an existing contact by its ID. To use this endpoint, make a DELETE request to the following URL:
```bash
DELETE /api/v1/contacts/:id
```

Example Request:
```bash
DELETE /api/v1/contacts/8
```

Example Response (if the contact is successfully deleted):
```json
No content, status code: 204
```

Example Response (if the contact does not exist):
```json
{
  "error": "Contact not found..."
}
```

## Show your support
If you find this project helpful, consider giving it a ⭐️ on GitHub!
This README was manually created with ❤️