---TYPE Any-Conf-Type
:LIST
Conf-Type | Extended-Conf-Type 

---TYPE Aux-Item
:LIST
aux-no : Aux-No
tag : INT32
creator : Pers-No
created-at : Time
flags : Aux-Item-Flags
inherit-limit : INT32
data : HOLLERITH


---TYPE Aux-Item-Flags
:BITSTRING
deleted
inherit
secret
hide-creator
dont-garb
reserved2
reserved3
reserved4


---TYPE Aux-Item-Input
:LIST
tag : INT32
flags : Aux-Item-Flags
inherit-limit : INT32
data : HOLLERITH


---TYPE Aux-No
:LIST
INT32 

---TYPE Conf-No
:LIST
INT16 

---TYPE Conf-Type
:BITSTRING
rd-prot
original
secret
letterbox


---TYPE Conf-Z-Info
:LIST
name : HOLLERITH
type : Conf-Type
conf-no : Conf-No


---TYPE Conference
:LIST
name : HOLLERITH
type : Extended-Conf-Type
creation-time : Time
last-written : Time
creator : Pers-No
presentation : Text-No
supervisor : Conf-No
permitted-submitters : Conf-No
super-conf : Conf-No
msg-of-day : Text-No
nice : Garb-Nice
keep-commented : Garb-Nice
no-of-members : INT16
first-local-no : Local-Text-No
no-of-texts : INT32
expire : Garb-Nice
aux-items : ARRAY Aux-Item


---TYPE Dynamic-Session-Info
:LIST
session : Session-No
person : Pers-No
working-conference : Conf-No
idle-time : INT32
flags : Session-Flags
what-am-i-doing : HOLLERITH


---TYPE Extended-Conf-Type
:BITSTRING
rd-prot
original
secret
letterbox
allow-anonymous
forbid-secret
reserved2
reserved3


---TYPE Garb-Nice
:LIST
INT32 

---TYPE Info
:LIST
version : INT32
conf-pres-conf : Conf-No
pers-pres-conf : Conf-No
motd-conf : Conf-No
kom-news-conf : Conf-No
motd-of-lyskom : Text-No
aux-item-list : ARRAY Aux-Item


---TYPE Info-Old
:LIST
version : INT32
conf-pres-conf : Conf-No
pers-pres-conf : Conf-No
motd-conf : Conf-No
kom-news-conf : Conf-No
motd-of-lyskom : Text-No


---TYPE Info-Type
:LIST
ENUMERATION-OF
Misc-Info


---TYPE Local-Text-No
:LIST
INT32 

---TYPE Local-To-Global-Block
:SELECTION
0=sparse sparse-block : ARRAY Text-Number-Pair
1=dense dense-block : Text-List


---TYPE Mark
:LIST
text-no : Text-No
type : INT8


---TYPE Member
:LIST
member : Pers-No
added-by : Pers-No
added-at : Time
type : Membership-Type


---TYPE Membership
:LIST
position : INT32
last-time-read : Time
conference : Conf-No
priority : INT8
read-ranges : ARRAY Read-Range
added-by : Pers-No
added-at : Time
type : Membership-Type


---TYPE Membership-Type
:BITSTRING
invitation
passive
secret
passive-message-invert
reserved2
reserved3
reserved4
reserved5


---TYPE Misc-Info
:SELECTION
0=recpt recipient : Conf-No
1=cc-recpt cc-recipient : Conf-No
2=comm-to comment-to : Text-No
3=comm-in commented-in : Text-No
4=footn-to footnote-to : Text-No
5=footn-in footnoted-in : Text-No
6=loc-no local-no : Local-Text-No
7=rec-time received-at : Time
8=sent-by sender : Pers-No
9=sent-at sent-at : Time
15=bcc-recpt bcc-recipient : Conf-No


---TYPE Pers-No
:LIST
Conf-No 

---TYPE Person
:LIST
username : HOLLERITH
privileges : Priv-Bits
flags : Personal-Flags
last-login : Time
user-area : Text-No
total-time-present : INT32
sessions : INT32
created-lines : INT32
created-bytes : INT32
read-texts : INT32
no-of-text-fetches : INT32
created-persons : INT16
created-confs : INT16
first-created-local-no : INT32
no-of-created-texts : INT32
no-of-marks : INT16
no-of-confs : INT16


---TYPE Personal-Flags
:BITSTRING
unread-is-secret
flg2
flg3
flg4
flg5
flg6
flg7
flg8


---TYPE Priv-Bits
:BITSTRING
wheel
admin
statistic
create-pers
create-conf
change-name
flg7
flg8
flg9
flg10
flg11
flg12
flg13
flg14
flg15
flg16


---TYPE Read-Range
:LIST
first-read : Local-Text-No
last-read : Local-Text-No


---TYPE Session-Flags
:BITSTRING
invisible
user-active-used
user-absent
reserved3
reserved4
reserved5
reserved6
reserved7


---TYPE Session-No
:LIST
INT32 

---TYPE Static-Server-Info
:LIST
boot-time : Time
save-time : Time
db-status : HOLLERITH
existing-texts : INT32
highest-text-no : Text-No
existing-confs : INT32
existing-persons : INT32
highest-conf-no : Conf-No


---TYPE Static-Session-Info
:LIST
username : HOLLERITH
hostname : HOLLERITH
ident-user : HOLLERITH
connection-time : Time


---TYPE Stats
:LIST
average : FLOAT
ascent-rate : FLOAT
descent-rate : FLOAT


---TYPE Stats-Description
:LIST
what : ARRAY HOLLERITH
when : ARRAY INT32


---TYPE Text-List
:LIST
first-local-no : Local-Text-No
texts : ARRAY Text-No


---TYPE Text-Mapping
:LIST
range-begin : Local-Text-No
range-end : Local-Text-No
more-texts-exists : BOOL
block : Local-To-Global-Block


---TYPE Text-No
:LIST
INT32 

---TYPE Text-Number-Pair
:LIST
local-number : Local-Text-No
global-number : Text-No


---TYPE Text-Stat
:LIST
creation-time : Time
author : Pers-No
no-of-lines : INT32
no-of-chars : INT32
no-of-marks : INT16
misc-info : ARRAY Misc-Info
aux-items : ARRAY Aux-Item


---TYPE Time
:LIST
seconds : INT32
minutes : INT32
hours : INT32
day : INT32
month : INT32
year : INT32
day-of-week : INT32
day-of-year : INT32
is-dst : BOOL


---TYPE UConference
:LIST
name : HOLLERITH
type : Extended-Conf-Type
highest-local-no : Local-Text-No
nice : Garb-Nice


---TYPE Version-Info
:LIST
protocol-version : INT32
server-software : HOLLERITH
software-version : HOLLERITH


---TYPE Who-Info
:LIST
person : Pers-No
working-conference : Conf-No
session : Session-No
what-am-i-doing : HOLLERITH
username : HOLLERITH


---REQ 80 accept-async
:LIST
request-list : ARRAY INT32 
-> 


---REQ 32 add-comment
:LIST
text-no : Text-No
comment-to : Text-No 
-> 


---REQ 37 add-footnote
:LIST
text-no : Text-No
footnote-to : Text-No 
-> 


---REQ 100 add-member
:LIST
conf-no : Conf-No
pers-no : Pers-No
priority : INT8
where : INT16
type : Membership-Type 
-> 


---REQ 30 add-recipient
:LIST
text-no : Text-No
conf-no : Conf-No
recpt-type : Info-Type 
-> 


---REQ 2 change-conference
:LIST
conference : Conf-No 
-> 


---REQ 3 change-name
:LIST
conference : Conf-No
new-name : HOLLERITH 
-> 


---REQ 4 change-what-i-am-doing
:LIST
what-am-i-doing : HOLLERITH 
-> 


---REQ 87 create-anonymous-text
:LIST
text : HOLLERITH
misc-info : ARRAY Misc-Info
aux-items : ARRAY Aux-Item-Input 
-> 
Text-No 


---REQ 88 create-conf
:LIST
name : HOLLERITH
type : Any-Conf-Type
aux-items : ARRAY Aux-Item-Input 
-> 
Conf-No 


---REQ 89 create-person
:LIST
name : HOLLERITH
passwd : HOLLERITH
flags : Personal-Flags
aux-items : ARRAY Aux-Item-Input 
-> 
Pers-No 


---REQ 86 create-text
:LIST
text : HOLLERITH
misc-info : ARRAY Misc-Info
aux-items : ARRAY Aux-Item-Input 
-> 
Text-No 


---REQ 11 delete-conf
:LIST
conf : Conf-No 
-> 


---REQ 29 delete-text
:LIST
text : Text-No 
-> 


---REQ 55 disconnect
:LIST
session-no : Session-No 
-> 


---REQ 42 enable
:LIST
level : INT8 
-> 


---REQ 116 find-next-conf-no
:LIST
start : Conf-No 
-> 
Conf-No 


---REQ 60 find-next-text-no
:LIST
start : Text-No 
-> 
Text-No 


---REQ 117 find-previous-conf-no
:LIST
start : Conf-No 
-> 
Conf-No 


---REQ 61 find-previous-text-no
:LIST
start : Text-No 
-> 
Text-No 


---REQ 114 first-unused-conf-no
:LIST
-> 
Conf-No 


---REQ 115 first-unused-text-no
:LIST
-> 
Text-No 


---REQ 113 get-boottime-info
:LIST
-> 
Static-Server-Info 


---REQ 70 get-client-name
:LIST
session : Session-No 
-> 
HOLLERITH 


---REQ 71 get-client-version
:LIST
session : Session-No 
-> 
HOLLERITH 


---REQ 85 get-collate-table
:LIST
-> 
HOLLERITH 


---REQ 91 get-conf-stat
:LIST
conf-no : Conf-No 
-> 
Conference 


---REQ 94 get-info
:LIST
-> 
Info 


---REQ 58 get-last-text
:LIST
before : Time 
-> 
Text-No 


---REQ 23 get-marks
:LIST
-> 
ARRAY Mark 


---REQ 101 get-members
:LIST
conf : Conf-No
first : INT16
no-of-members : INT16 
-> 
ARRAY Member 


---REQ 108 get-membership
:LIST
person : Pers-No
first : INT16
no-of-confs : INT16
want-read-ranges : BOOL
max-ranges : INT32 
-> 
ARRAY Membership 


---REQ 49 get-person-stat
:LIST
pers-no : Pers-No 
-> 
Person 


---REQ 84 get-static-session-info
:LIST
session-no : Session-No 
-> 
Static-Session-Info 


---REQ 112 get-stats
:LIST
what : HOLLERITH 
-> 
ARRAY Stats 


---REQ 111 get-stats-description
:LIST
-> 
Stats-Description 


---REQ 25 get-text
:LIST
text : Text-No
start-char : INT32
end-char : INT32 
-> 
HOLLERITH 


---REQ 90 get-text-stat
:LIST
text-no : Text-No 
-> 
Text-Stat 


---REQ 35 get-time
:LIST
-> 
Time 


---REQ 78 get-uconf-stat
:LIST
conference : Conf-No 
-> 
UConference 


---REQ 52 get-unread-confs
:LIST
pers-no : Pers-No 
-> 
ARRAY Conf-No 


---REQ 75 get-version-info
:LIST
-> 
Version-Info 


---REQ 103 local-to-global
:LIST
conf-no : Conf-No
first-local-no : Local-Text-No
no-of-existing-texts : INT32 
-> 
Text-Mapping 


---REQ 121 local-to-global-reverse
:LIST
conf-no : Conf-No
local-no-ceiling : Local-Text-No
no-of-existing-texts : INT32 
-> 
Text-Mapping 


---REQ 62 login
:LIST
person : Pers-No
passwd : HOLLERITH
invisible : BOOL 
-> 


---REQ 1 logout
:LIST
-> 


---REQ 76 lookup-z-name
:LIST
name : HOLLERITH
want-pers : BOOL
want-confs : BOOL 
-> 
ARRAY Conf-Z-Info 


---REQ 104 map-created-texts
:LIST
author : Pers-No
first-local-no : Local-Text-No
no-of-existing-texts : INT32 
-> 
Text-Mapping 


---REQ 122 map-created-texts-reverse
:LIST
author : Pers-No
local-no-ceiling : Local-Text-No
no-of-existing-texts : INT32 
-> 
Text-Mapping 


---REQ 27 mark-as-read
:LIST
conference : Conf-No
text : ARRAY Local-Text-No 
-> 


---REQ 109 mark-as-unread
:LIST
conference : Conf-No
text : Local-Text-No 
-> 


---REQ 72 mark-text
:LIST
text : Text-No
mark-type : INT8 
-> 


---REQ 93 modify-conf-info
:LIST
conf : Conf-No
delete : ARRAY Aux-No
add : ARRAY Aux-Item-Input 
-> 


---REQ 95 modify-system-info
:LIST
items-to-delete : ARRAY Aux-No
items-to-add : ARRAY Aux-Item-Input 
-> 


---REQ 92 modify-text-info
:LIST
text : Text-No
delete : ARRAY Aux-No
add : ARRAY Aux-Item-Input 
-> 


---REQ 81 query-async
:LIST
-> 
ARRAY INT32 


---REQ 96 query-predefined-aux-items
:LIST
-> 
ARRAY INT32 


---REQ 107 query-read-texts
:LIST
person : Pers-No
conference : Conf-No
want-read-ranges : BOOL
max-ranges : INT32 
-> 
Membership 


---REQ 74 re-z-lookup
:LIST
regexp : HOLLERITH
want-persons : BOOL
want-confs : BOOL 
-> 
ARRAY Conf-Z-Info 


---REQ 53 send-message
:LIST
recipient : Conf-No
message : HOLLERITH 
-> 


---REQ 69 set-client-version
:LIST
client-name : HOLLERITH
client-version : HOLLERITH 
-> 


---REQ 21 set-conf-type
:LIST
conf-no : Conf-No
type : Any-Conf-Type 
-> 


---REQ 120 set-connection-time-format
:LIST
use-utc : BOOL 
-> 


---REQ 17 set-etc-motd
:LIST
conf-no : Conf-No
text-no : Text-No 
-> 


---REQ 22 set-garb-nice
:LIST
conf-no : Conf-No
nice : Garb-Nice 
-> 


---REQ 79 set-info
:LIST
info : Info-Old 
-> 


---REQ 105 set-keep-commented
:LIST
conf-no : Conf-No
keep-commented : Garb-Nice 
-> 


---REQ 77 set-last-read
:LIST
conference : Conf-No
last-read : Local-Text-No 
-> 


---REQ 102 set-membership-type
:LIST
pers : Pers-No
conf : Conf-No
type : Membership-Type 
-> 


---REQ 41 set-motd-of-lyskom
:LIST
text-no : Text-No 
-> 


---REQ 8 set-passwd
:LIST
person : Pers-No
old-pwd : HOLLERITH
new-pwd : HOLLERITH 
-> 


---REQ 19 set-permitted-submitters
:LIST
conf-no : Conf-No
perm-sub : Conf-No 
-> 


---REQ 106 set-pers-flags
:LIST
pers-no : Pers-No
flags : Personal-Flags 
-> 


---REQ 16 set-presentation
:LIST
conf-no : Conf-No
text-no : Text-No 
-> 


---REQ 7 set-priv-bits
:LIST
person : Pers-No
privileges : Priv-Bits 
-> 


---REQ 110 set-read-ranges
:LIST
conference : Conf-No
read-ranges : ARRAY Read-Range 
-> 


---REQ 20 set-super-conf
:LIST
conf-no : Conf-No
super-conf : Conf-No 
-> 


---REQ 18 set-supervisor
:LIST
conf-no : Conf-No
admin : Conf-No 
-> 


---REQ 40 set-unread
:LIST
conf-no : Conf-No
no-of-unread : INT32 
-> 


---REQ 57 set-user-area
:LIST
pers-no : Pers-No
user-area : Text-No 
-> 


---REQ 44 shutdown-kom
:LIST
exit-val : INT8 
-> 


---REQ 33 sub-comment
:LIST
text-no : Text-No
comment-to : Text-No 
-> 


---REQ 38 sub-footnote
:LIST
text-no : Text-No
footnote-to : Text-No 
-> 


---REQ 15 sub-member
:LIST
conf-no : Conf-No
pers-no : Pers-No 
-> 


---REQ 31 sub-recipient
:LIST
text-no : Text-No
conf-no : Conf-No 
-> 


---REQ 43 sync-kom
:LIST
-> 


---REQ 73 unmark-text
:LIST
text-no : Text-No 
-> 


---REQ 82 user-active
:LIST
-> 


---REQ 56 who-am-i
:LIST
-> 
Session-No 


---REQ 83 who-is-on-dynamic
:LIST
want-visible : BOOL
want-invisible : BOOL
active-last : INT32 
-> 
ARRAY Dynamic-Session-Info 


---REQ 14 async-deleted-text
:LIST
text-no : Text-No
text-stat : Text-Stat 


---REQ 6 async-i-am-on
:LIST
info : Who-Info 


---REQ 8 async-leave-conf
:LIST
conf-no : Conf-No 


---REQ 9 async-login
:LIST
pers-no : Pers-No
session-no : Session-No 


---REQ 13 async-logout
:LIST
pers-no : Pers-No
session-no : Session-No 


---REQ 18 async-new-membership
:LIST
pers-no : Pers-No
conf-no : Conf-No 


---REQ 21 async-new-motd
:LIST
conf-no : Conf-No
old-motd : Text-No
new-motd : Text-No 


---REQ 5 async-new-name
:LIST
conf-no : Conf-No
old-name : HOLLERITH
new-name : HOLLERITH 


---REQ 20 async-new-presentation
:LIST
conf-no : Conf-No
old-presentation : Text-No
new-presentation : Text-No 


---REQ 16 async-new-recipient
:LIST
text-no : Text-No
conf-no : Conf-No
type : Info-Type 


---REQ 15 async-new-text
:LIST
text-no : Text-No
text-stat : Text-Stat 


---REQ 19 async-new-user-area
:LIST
pers-no : Pers-No
old-user-area : Text-No
new-user-area : Text-No 


---REQ 11 async-rejected-connection
:LIST


---REQ 12 async-send-message
:LIST
recipient : Conf-No
sender : Pers-No
message : HOLLERITH 


---REQ 17 async-sub-recipient
:LIST
text-no : Text-No
conf-no : Conf-No
type : Info-Type 


---REQ 7 async-sync-db
:LIST


---REQ 22 async-text-aux-changed
