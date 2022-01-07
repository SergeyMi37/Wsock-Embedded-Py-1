Class rccpy.WSockPy [ Not ProcedureBlock ]
{

/// main 
ClassMethod Run()
{
	write !!,"*** Welcome to WebSocket Embedded Python Demo ***",!!
	kill ^ZSocketIn
	set py=##class(%SYS.Python).Import("wsclient2")	
	for  {
		do selsrv quit:$t
N		do text,control 
		goto @ctrl 
S		do submit,control 
		goto @ctrl
#; E		continue		
#; Z
X		quit		 
		}
	if $g(srv) do py.close()
	quit

submit
	set top=^ZSocketIn(0)
	write !,"******* Submit "_top_" Lines *******",! 
	for n=1:1:top {
		write n,?8
		set ans=py.echo($ZCVT(^ZSocketIn(n),"O","JSON"))
		}
	quit
	
control
	write !!,"Select action for WebSocket Service",!
	read "Send+Listen(S),New Text(N),Exit(X) [S]", ctrl
	set ctrl=$e($zcvt(ctrl,"U"))
	if "SNX"'[ctrl goto control
	if ctrl="" set ctrl="S" write "S"
	write !,"%%%%%%%%%%%%%%%%%%%%%%%%%%",!
	set ctrl=$e($zcvt(ctrl,"U"))
	quit 			

selsrv
	set server(1)="ws://echodocker:8080/"
		,server(2)="ws://localhost:10000/"
		,server(3)="--- server 3 ----"
	write "Known Hosts (*=Exit) [1]:",!
	for i=1:1:3 write i,?3,server(i),!
	read "select (1): ",srv
	if srv="*" quit
	if 'srv ; fix for demo
			set srv=1 
	write " ==> ",server(srv),!,"Python Connection Object:",!
	set sc=py.connect(server(srv))
	write !,"%%%%%%",!!	
	if 0	
	quit

text
	write "Enter text to get echoed from WebSocketClient Service",!,
		"Terminate with * at first position",!,
		"or get generated text by %",!,
		"or append new text with @",! 
	for n=1:1 {
		write !,n,?5 read line quit:$e(line)="*"
		if $e(line)="@" {
			set n=$g(^ZSocketIn(0))
			continue
		}   
		if $e(line)="%" {
			do lorem 
			set (fm,to)=0
			for n=n:1 {
				set fm=to+1
					,to=fm+20+$r(40)
					,sp=$find(lorem," ",to)-1
					,to=$s(sp>to:sp,1:to)
					,line=$e(lorem,fm,to)
					,^ZSocketIn(n)=line
				write !,n,?5,"* ",line
				quit:to>=$l(lorem)
				}
			continue
		}
		set ^ZSocketIn(n)=line_" "
	}
	set ^ZSocketIn(0)=n-1
    quit

lorem
	set lorem="Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy "_
			"nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. "_
			"Ut wisi enim ad minim veniam, quis nostrud exercitation ulliam corper "_
			"suscipit lobortis nisl ut aliquip ex ea commodo consequat. "_
			"Duis autem veleum iriure dolor in hendrerit in vulputate velit esse molestie "_
			"consequat, vel willum lunombro dolore eu feugiat nulla facilisis at vero "_
			"eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril "_
			"delenit augue duis dolore te feugait nulla facilisi. "_
			"Li Europan lingues es membres del sam familie. "_
			"Lor separat existentie es un myth. Por scientie, musica, sport etc., "_
			"li tot Europa usa li sam vocabularium. Li lingues differe solmen in li grammatica, "_
			"li pronunciation e li plu commun vocabules. Omnicos directe al desirabilit… "_
			"de un nov lingua franca: on refusa continuar payar custosi traductores. "_
			"It solmen va esser necessi far uniform grammatica, pronunciation e plu sommun "_
			"paroles. Ma quande lingues coalesce, li grammatica del resultant lingue es "_
			"plu simplic e regulari quam ti del coalescent lingues. Li nov lingua franca "_
			"va esser plu simplic e regulari quam li existent Europan lingues. "_
			"It va esser tam simplic quam Occidental: in fact, it va esser Occidental. "_
			"A un Angleso it va semblar un simplificat Angles, quam un skeptic Cambridge "_
			"amico dit me que Occidental es."
	quit
}

}
