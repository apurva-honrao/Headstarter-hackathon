# Categorized Complaints App

This Ruby on Rails App reads and stores complaints submitted on the main page into a categorized database using RAG.

## Built With

* [![Ruby on Rails][Ruby-on-Rails]][Ruby-on-Rails-url]
* [![Python][Python.org]][Python-url]
* [![PostgreSQL][PostgreSQL.org]][PostgreSQL-url]
* [![Hugging Face API][Hugging-Face]][Hugging-Face-url]
* [![Pinecone][Pinecone]][Pinecone-url]
  
## Getting Started

Here are the dependencies/ that need to be installed to run this app:

1. **Ruby on Rails**   
   [Ruby on Rails Installation Guide](https://guides.rubyonrails.org/getting_started.html#installing-rails)
   
2. **PostgreSQL**  
   [PostgreSQL Installation Guide](https://www.postgresql.org/download/)
   
3. **Python 3**  
   [Python Installation Guide](https://www.python.org/downloads/)
   
4. **Flask**  
   ```bash
   pip install Flask

#### Running the app

After installing the needed dependencies, follow these steps to get started with the application:

1. **Clone the Repository**  
   First, clone this repository to your local machine using Git:
   ```bash
   git clone https://github.com/apurva-honrao/Headstarter-hackathon.git


2. **Navigate to the Project Directory**  
   Change to the project directory:
   ```bash
   cd Headstarter-hackathon

3. **Run the Python Script and the Ruby App**  
   Open a terminal and navigate to the project directory:
   ```bash
   cd Headstarter-hackathon

   
4. Then open up a *different* shell and run the Ruby on Rails app:
   ```bash
   rails server

5. Now that the app is running, navigate to the localhost port where it is running and enter your complaint.
This is stored in the PostGres database which can be viewed by going back to the directory and running:
   ```bash
   rails console

6.Now that the app is running, navigate to the localhost port where it is running and enter your complaint.
This is stored in the PostGres database which can be viewed by going back to the directory and running:
    ```bash
   rails server

7. Then in the console, run:
   ```bash
   Complaint.all

You should be able to see the complaints stored in the database here with their respective categories.

##### Acknowledgement



<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!--Markdown Links-->
[Ruby-on-Rails]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Ruby-on-Rails-url]: https://rubyonrails.org/

[Python.org]: https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white
[Python-url]: https://www.python.org/

[PostgreSQL.org]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[PostgreSQL-url]: https://www.postgresql.org/

[Pinecone]: https://img.shields.io/badge/Pinecone-003F5C?style=for-the-badge&logo=pinecone&logoColor=white
[Pinecone-url]: https://www.pinecone.io/

[Hugging-Face]: https://img.shields.io/badge/Hugging_Face-FFBF00?style=for-the-badge&logo=huggingface&logoColor=white
[Hugging-Face-url]: https://huggingface.co/
