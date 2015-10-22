package main

import (
	"log"
	"net/smtp"
)

func main() {
	send_email("Hi all \n\n" +
		"Backup on server 10.20.30.100 is done. You can ignore this email.")
}

func send_email(body string) {
	// Set up authentication information.
	from := "no-reply@nhindeogi.com.vn"
	to := "quangteospk@gmail.com"
	server := "smtp.zoho.com:465"
	passwd := "random-password"

	auth := smtp.PlainAuth(
		"",
		from,
		passwd,
		server,
	)

	// Message of email
	msg := "From:" + from + "\n" +
		"To: " + to + "\n" +
		"Subject: [System Alert] Backup system is finish\n\n" +
		body

	// Connect to the server, authenticate, set the sender and recipient,
	// and send the email all in one step.
	err := smtp.SendMail(
		server,
		auth,
		from,
		[]string{to},
		[]byte(msg),
	)

	if err != nil {
		log.Fatal(err)
	}

	log.Print("sent, visit http://0x7xz.io")
}
