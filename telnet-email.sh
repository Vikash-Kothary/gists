mail_sender ()
{
    echo " - FROM : "
    read from
    echo " - TO : "
    read to
    echo " - Subject : "
    read subject
    echo " - Message : "
    read message
    telnet localhost 25 << EOF
ehlo triton.itinet.fr
mail from: $from
rcpt to: $to
data
subject: $subject
$message
.
EOF
}