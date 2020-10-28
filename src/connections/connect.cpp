#include "connect.h"

void Connect::start_server() {
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);

    sockaddr_in sockaddr;
    sockaddr.sin_family = AF_INET;
    sockaddr.sin_addr.s_addr = INADDR_ANY;
    sockaddr.sin_port = htons(1999);

    if(bind(sockfd, (struct sockaddr*)&sockaddr, sizeof(sockaddr))) {

    }

    if (listen(sockfd, 10) < 0) {

    }

    auto addrlen = sizeof(sockaddr);

    int connection = accept(sockfd, (struct sockaddr*)&sockaddr, (socklen_t*)&addrlen);

    char buffer[100];

    auto bytesread = read(connection, buffer, 100);

    std::cout << "The message was: " << buffer << std::endl;

    char bye[5] = "Bye!";
    send(connection, "bye!", 5, 0);
    close(connection);
    close(sockfd);
}