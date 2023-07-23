<h1 align="center">Welcome to ror-exploration 👋</h1>

<p>
  This is a collection of RESTful APIs built using Ruby on Rails, providing endpoints for managing employees and their contacts.
</p>

### Features

- Create, Read, Update, and Delete (CRUD) operations for managing employees and contacts.
- Pagination support for listing employees.
- Validations for ensuring data integrity, such as unique NIK and valid gender values.
- Error handling with clear error messages for better user feedback.
- API endpoints for retrieving contacts associated with a specific employee.

### Installation

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

### API Endpoints
## Employees
- GET /api/v1/employees: List all employees, including the pagination.
- GET /api/v1/employees/:id: Show details of a specific employee.
- POST /api/v1/employees: Create a new employee.
- PATCH /api/v1/employees/:id: Update an existing employee (with restrictions).
- DELETE /api/v1/employees/:id: Delete an employee.
## Contacts
- GET /api/v1/employees: List all contacts.
- GET /api/v1/contacts?employee_id=:employee_id: List contacts associated with a specific employee.
- POST /api/v1/contacts: Create a new contact.
- PATCH /api/v1/contacts/:id: Update an existing contact.
- DELETE /api/v1/contacts/:id: Delete a contact.

### Usage
## Employees
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
```bash
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
## Explanation:

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
```bash
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
```bash
{
  "error": "Employee not found..."
}
```

Explanation:

- The response includes all the details of the requested employee if found.
- If the employee does not exist, the response will contain an "error" key with the corresponding error message.