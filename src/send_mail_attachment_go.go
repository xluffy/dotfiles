package main

import (
	"github.com/jordan-wright/email"
	"log"
	"net/smtp"
)

func main() {
	m := email.NewEmail()
	m.From = "System Alert <no-reply@nhindeogi.com>"
	m.To = []string{"Quang <xquang.foss@gmail.com>"}
	m.AttachFile("/tmp/backup.txt")
	server := "smtp.zoho.com:465"
	passwd := "random-pwd"

	m.Subject = "[System Alert] Backup system is finish\n\n"
	m.Text = []byte("Hi all \n\n" +
		"Backup on server 10.20.30.100 is done. Plz see attachment.\n\n" +
		"--\n" +
		"bot")

	err := m.Send(server, smtp.PlainAuth("", "no-reply@nhindeogi.com", passwd, server))

	if err != nil {
		log.Fatal(err)
	}

	log.Print("sent, visit http://www.nhindeogi.com")
}
