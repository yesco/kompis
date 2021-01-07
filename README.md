= KOM Protocol Informationm Server

== kompis

The user-interactive gateway. May be controlled on the command-line, or used by a "nc" (netcat) script, to make it a network service.

=== example session

    Kompis> HELP
    QUIT
    login disconnect lookup-z-name
    change-what-i-am-doing change-conference who-am-i who-is-on-ident get-session-info-ident user-active

    lookup-person lookup-conf re-lookup-person re-lookup-conf re-z-lookup lookup-z-name
    
    (change-name set-password get-marks)

    accept-async query-async
    
    who-is-on-dynamic who-is-on 
    
    get-text get-text-stat
    mark-as-read mark-as-unread set-read-ranges mark-text unmark-text
    get-map
    (get-created-text get-last-text find-next-text-no find-previous-text-no)
    
    query-read-texts-10
    
    get-unread-confs
    get-person-stat get-uconf-stat
    set-unread set-last-read
    local-to-global-reverse
    map-created-texts-reverse
    
    (set-etc-motd)
    get-membership
    
    send-message

    create-text create-anonymous-text
    create-conf create-person

    get-stats get-stats-description
    get-boottime-info
    first-unused-conf-no first-unused-text-no find-next-conf-no find-prev-conf-no get-sceduling
    
    ...

== return format

One idea, however, to keep it dynamic and not fixed is to generate modern extensible textual structures, such as JSON, XML, outline-format, or what not.

It may pretty-print the result in interactive mode and include newlines (\n) for prettyness. However, for machine-readable reasons: the results should not contain newlines, and text/strings returned that contains newlines are either quoted with '"' or use their original hollerith-format.

== kompile

This is a simple parser-generator for C program to talk to a LysKOM-server and generate readable/tagged answers, may it be JSON, XML, or other format.

== DDL

It takes the raw protocol in machine-readable format and generates a kind of DDL (data definintion language), that then is used to generate parsing code. There can be several parsers in several langauges, and each parser may store/return the data in various ways. 

== 