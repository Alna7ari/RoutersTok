#describe:يقوم باعادة عدد الموجودين في الاكتڤ##
:local activeCount [ :len [/ip hotspot active find] ]
:return ("عدد المستخدمين المتواجدين الان: ".$activeCount)
