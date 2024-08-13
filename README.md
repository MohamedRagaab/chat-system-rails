# Rails Chat System
* Building a chat system using Ruby on Rails, the system is to receive many requests. It might be running on multiple servers in
parallel and thus multiple requests may be processed concurrently. It handles race
conditions. It minimizes the queries and avoids writing directly to MySQL while serving the
requests(especially for the chats and messages creation endpoints) and it uses a queuing
system to achieve that and the app is containerized.
* Sequence Diagram
<div align='center'>
<img height="350px" src="https://github.com/user-attachments/assets/20f0cb44-bd80-45df-81ff-905549ba0968">
<hr/>
</div>

## Languages and frameworks 📑
* Ruby on Rails
* MySql
* ElasticSearch
* Redis
* Sidekiq
## Features 🥇
* Easy create, update and show apps, chats and messages using Ruby on Rails framework.
## Cloning the repo and starting the app
* clone the repository and open the project in any IDE
``` bash
git clone https://github.com/MohamedRagaab/chat-system-rails.git
cd chat-system-rails
```
* You can run the following command to start the app
``` bash
docker compose up
```
or 
``` bash
docker-compose up
```
## Usage 🚀
* Here is the list of the RESTful APIs
  - Application:
 
    - Create a new application:

        ``` bash
        curl --location 'http://127.0.0.1:3000/api/v1/applications' \
        --header 'Content-Type: application/json' \
        --data '{
          "name": "app name"
        }'
        ```
    - Read a specific application:
        ``` bash
        curl --location 'http://127.0.0.1:3000/api/v1/applications/:token'
        ```
    - Update a specific application:
        ``` bash
        curl --location --request PUT 'http://127.0.0.1:3000/api/v1/applications/:token' \
        --header 'Content-Type: application/json' \
        --data '{
          "name": "updated app"
        }'
        ```

  - Chats:
 
    - Create a new chat:
        ``` bash
        curl --location --request POST 'http://127.0.0.1:3000/api/v1/applications/:token/chats'
        ```
    - Read a specific chat:
        ``` bash
        curl --location 'http://127.0.0.1:3000/api/v1/applications/:token/chats/:number'
        ```
        
  - Message:
 
    - Create a new message:
        ``` bash
        curl --location 'http://127.0.0.1:3000/api/v1/applications/:token/chats/:number/messages' \
        --header 'Content-Type: application/json' \
        --data '{
          "message": {
            "body": "message body"
          }
        }
        '
        ```
    - Read a specific message under a chat:
        ``` bash
        curl --location 'http://127.0.0.1:3000/api/v1/applications/:token/chats/:chat_number/messages/:message_number'
        ```
    - Update a specific message:
        ``` bash
        curl --location --request PUT 'http://127.0.0.1:3000/api/v1/applications/:token/chats/:chat_number/messages/:message_number' \
        --header 'Content-Type: application/json' \
        --data '{
            "message": {
                "body": "final 44"
             }  
        }
        '
        ```
    - List all messages under a specific chat:
        ``` bash
        curl --location 'http://127.0.0.1:3000/api/v1/applications/:token/chats/:chat_number/messages'
        ```

    - Search messages under a specific chat:
        ``` bash
       curl --location 'http://127.0.0.1:3000/api/v1/applications/:token/chats/:chat_number/messages/search?query=final'
        ```

## Repo Content :white_check_mark:
- [x] Application Endpoints
- [x] Chat Endpoints
- [x] Message Endpoint
- [x] Using elasticsearch for searching messages
- [x] Using queuing system (Sidekiq)
- [x] Counts chat and message numbers in background (cron job)
- [x] Containerize the app (docker-compose.yml)
- [x] Using in-memory DB (Redis)
- [x] Writing a Readme file

