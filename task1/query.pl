main :-
    dukra(Dukra, TevasMama). % rask visas dukras ir ju tevus
    dukra(ona, jonas). % true
    dukra(tomas, zita). % false

    uosve(Uosve, Zentas). % rask visas uosves ir ju zentus
    uosve(elena, antanas). % true
    uosve(zita, jonas). % false

    vidurinis(Vaikas). % rask visus vidurinius vaikus
    vidurinis(tomas). % true

    dar_pagyvens(Asmuo). % rask asmenis kurie dar pagyvens
    dar_pagyvens(jonas). % true (nes megsta zukle)
    dar_pagyvens(elena). % false (nes amzius >= 64)
