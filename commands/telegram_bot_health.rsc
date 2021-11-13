#describe:يقوم بإعادة حالة الراوتر وعدد الاكتف التفصيلي##
#:return $args
:local cpuTemp [system health get cpu-temperature];
:if (!$cpuTemp) do={:set cpuTemp [system health get temperature]};
:local cpuLoad [system resource get cpu-load];
:local deviceUptime [system resource get uptime];
:local hostCount [ :len [/ip hotspot host find] ];
:local neighborCount [:len [/ip neighbor find]];
:local activeCount [ :len [/ip hotspot active find] ];
:local activer [ :len [/ip hotspot active find radius] ];
:local activeh ($activeCount - $activer);
:local resultMessage ("\D8\AD\D8\B1\D8\A7\D8\B1\D8\A9\20\D8\A7\D9\84\D9\85\D8\B9\D8\A7\D9\84\D8\AC: "."$cpuTemp"."\D8\AF\D8\B1\D8\AC\D8\A9"."\n");
:set resultMessage ("$resultMessage"."\D8\AD\D9\85\D9\84\20\D8\A7\D9\84\D9\85\D8\B9\D8\A7\D9\84\D8\AC: "."$cpuLoad"."%"."\n");
:set resultMessage ("$resultMessage"."\D9\88\D9\82\D8\AA\20\D8\A7\D9\84\D8\AA\D8\B4\D8\BA\D9\8A\D9\84: "."$deviceUptime"."\n");
:set resultMessage ("$resultMessage"."\D8\AC\D9\85\D9\8A\D8\B9\20\D8\A7\D9\84\D9\85\D8\AA\D8\B5\D9\84\D9\8A\D9\86\20\D8\A8\D8\A7\D9\84\D8\B4\D8\A8\D9\83\D8\A9: "."$hostCount"."\n");
:set resultMessage ("$resultMessage"."\D8\B9\D8\AF\D8\AF\20\D8\A7\D9\84\D8\A7\D8\AC\D9\87\D8\B2\D8\A9\20\D9\81\D9\8A\20\D8\A7\D9\84\D9\86\D9\8A\D8\A8\D8\B1\D8\B2: "."$neighborCount"."\n");
:set resultMessage ("$resultMessage"."\D8\B9\D8\AF\D8\AF\20\D8\A7\D9\84\D8\A7\D9\83\D8\AA\D9\81\20\D9\8A\D9\88\D8\B2\D8\B1\20\D9\85\D9\86\D8\AC\D8\B1\20\D9\81\D9\82\D8\B7: "."$activer"."\n");
:set resultMessage ("$resultMessage"."\D8\B9\D8\AF\D8\AF\20\D8\A7\D9\84\D8\A7\D9\83\D8\AA\D9\81\20\D9\87\D9\88\D8\AA\D8\B3\D8\A8\D9\88\D8\AA\20\D9\81\D9\82\D8\B7: "."$activeh"."\n");
:set resultMessage ("$resultMessage"."\D8\B9\D8\AF\D8\AF\20\D8\A7\D9\84\D8\A7\D9\83\D8\AA\D9\81\20\D8\A7\D9\84\D9\83\D9\84\D9\8A: "."$activeCount"."\n");
:return $resultMessage;
