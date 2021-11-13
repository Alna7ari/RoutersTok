#describe:يقوم باعادة الاستخدام الكلي بالميجا للبيانات لاسم المنفذ الممرر بعد الامر, مثال: tuse ether1 ويمكن تمرير اكثر من اسم منفذ, مثال: tuse ether1 pppoeout1##
if ($args = "none") do={
	return ("لايمكن استخدام هذا الامر بدون تمرير اسم المنفذ او المنافذ المطلوبة"."\n"."طريقة استخدام الامر:"."\n"."tuse <اسم المنفذ>")
}
:local resultMessage "";
:foreach extraEnterface in=[:toarray $args] do={
	:do {
		:local interfaceName [interface get $extraEnterface name];
		:set resultMessage ("$resultMessage"."--------------------------"."\n");
		:set resultMessage ("$resultMessage"."\D8\A7\D8\B3\D9\85\20\D8\A7\D9\84\D9\85\D9\86\D9\81\D8\B0: "."$interfaceName"."\n");
		:local rxTrafficUsed [/interface get $extraEnterface rx-byte];
		:local txTrafficUsed [/interface get $extraEnterface tx-byte];
		:local totalTrafficUsed [((($rxTrafficUsed + $txTrafficUsed)/1024)/1024)];
		:set resultMessage ("$resultMessage"."\D8\A7\D9\84\D8\B1\D8\B5\D9\8A\D8\AF\20\D8\A7\D9\84\D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85\20\D9\85\D9\86\D8\B0\20\D8\A7\D8\AE\D8\B1\20\D8\A7\D8\B9\D8\A7\D8\AF\D8\A9\20\D8\AA\D8\B4\D8\BA\D9\8A\D9\84: "."$totalTrafficUsed"." \D9\85\D9\8A\D8\AC\D8\A7\20\D8\A8\D8\A7\D9\8A\D8\AA"."\n");
		} on-error={}
	}
:return $resultMessage;
