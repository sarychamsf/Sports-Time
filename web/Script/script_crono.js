var centesimas1 = 0;
var segundos1 = 0;
var minutos1 = 0;
var horas1 = 0;
var final1 = 0;
function inicio1() {
    control1 = setInterval(cronometro1, 10);
    document.getElementById("inicio1").disabled = true;
    document.getElementById("parar1").disabled = false;
}
function parar1() {
    clearInterval(control1);
    document.getElementById("parar1").disabled = true;
}

function cronometro1() {
    if (centesimas1 < 99) {
        centesimas1++;
        if (centesimas1 < 10) {
            centesimas1 = "0" + centesimas1
        }
        Centesimas1.innerHTML = ":" + centesimas1;
    }
    if (centesimas1 == 99) {
        centesimas1 = -1;
    }
    if (centesimas1 == 0) {
        segundos1++;
        if (segundos1 < 10) {
            segundos1 = "0" + segundos1
        }
        Segundos1.innerHTML = ":" + segundos1;
    }
    if (segundos1 == 59) {
        segundos1 = -1;
    }
    if ((centesimas1 == 0) && (segundos1 == 0)) {
        minutos1++;
        if (minutos1 < 10) {
            minutos1 = "0" + minutos1
        }
        Minutos1.innerHTML = ":" + minutos1;
    }
    if (minutos1 == 59) {
        minutos1 = -1;
    }
    if ((centesimas1 == 0) && (segundos1 == 0) && (minutos1 == 0)) {
        horas1++;
        if (horas1 < 10) {
            horas1 = "0" + horas1
        }
        Horas1.innerHTML = horas1;
    }

    final1 = horas1 + ":" + minutos1 + ":" + segundos1 + ":" + centesimas1;
   
    return final1;

}




var centesimas2 = 0;
var segundos2 = 0;
var minutos2 = 0;
var horas2 = 0;
var final2 = 0;
function inicio2() {
    control2 = setInterval(cronometro2, 10);
    document.getElementById("inicio2").disabled = true;
    document.getElementById("parar2").disabled = false;
}
function parar2() {
    clearInterval(control2);
    document.getElementById("parar2").disabled = true;
}

function cronometro2() {
    if (centesimas2 < 99) {
        centesimas2++;
        if (centesimas2 < 10) {
            centesimas2 = "0" + centesimas2
        }
        Centesimas2.innerHTML = ":" + centesimas2;
    }
    if (centesimas2 == 99) {
        centesimas2 = -1;
    }
    if (centesimas2 == 0) {
        segundos2++;
        if (segundos2 < 10) {
            segundos2 = "0" + segundos2
        }
        Segundos2.innerHTML = ":" + segundos2;
    }
    if (segundos2 == 59) {
        segundos2 = -1;
    }
    if ((centesimas2 == 0) && (segundos2 == 0)) {
        minutos2++;
        if (minutos2 < 10) {
            minutos2 = "0" + minutos2
        }
        Minutos2.innerHTML = ":" + minutos2;
    }
    if (minutos2 == 59) {
        minutos2 = -1;
    }
    if ((centesimas2 == 0) && (segundos2 == 0) && (minutos2 == 0)) {
        horas2++;
        if (horas2 < 10) {
            horas2 = "0" + horas2
        }
        Horas2.innerHTML = horas2;
    }

    final2 = horas2 + ":" + minutos2 + ":" + segundos2 + ":" + centesimas2;
    return final2;


}

var centesimas3 = 0;
var segundos3 = 0;
var minutos3 = 0;
var horas3 = 0;
var final3 = 0;
function inicio3() {
    control3 = setInterval(cronometro3, 10);
    document.getElementById("inicio3").disabled = true;
    document.getElementById("parar3").disabled = false;
}
function parar3() {
    clearInterval(control3);
    document.getElementById("parar3").disabled = true;
}

function cronometro3() {
    if (centesimas3 < 99) {
        centesimas3++;
        if (centesimas3 < 10) {
            centesimas3 = "0" + centesimas3
        }
        Centesimas3.innerHTML = ":" + centesimas3;
    }
    if (centesimas3 == 99) {
        centesimas3 = -1;
    }
    if (centesimas3 == 0) {
        segundos3++;
        if (segundos3 < 10) {
            segundos3 = "0" + segundos3
        }
        Segundos3.innerHTML = ":" + segundos3;
    }
    if (segundos3 == 59) {
        segundos3 = -1;
    }
    if ((centesimas3 == 0) && (segundos3 == 0)) {
        minutos3++;
        if (minutos3 < 10) {
            minutos3 = "0" + minutos3
        }
        Minutos3.innerHTML = ":" + minutos3;
    }
    if (minutos3 == 59) {
        minutos3 = -1;
    }
    if ((centesimas3 == 0) && (segundos3 == 0) && (minutos3 == 0)) {
        horas3++;
        if (horas3 < 10) {
            horas3 = "0" + horas3
        }
        Horas3.innerHTML = horas3;
    }

    final3 = horas3 + ":" + minutos3 + ":" + segundos3 + ":" + centesimas3;
    return final3;

}

var centesimas4 = 0;
var segundos4 = 0;
var minutos4 = 0;
var horas4 = 0;
var final4 = 0;
function inicio4() {
    control4 = setInterval(cronometro4, 10);
    document.getElementById("inicio4").disabled = true;
    document.getElementById("parar4").disabled = false;
}
function parar4() {
    clearInterval(control4);
    document.getElementById("parar4").disabled = true;
}

function cronometro4() {
    if (centesimas4 < 99) {
        centesimas4++;
        if (centesimas4 < 10) {
            centesimas4 = "0" + centesimas4
        }
        Centesimas4.innerHTML = ":" + centesimas4;
    }
    if (centesimas4 == 99) {
        centesimas4 = -1;
    }
    if (centesimas4 == 0) {
        segundos4++;
        if (segundos4 < 10) {
            segundos4 = "0" + segundos4
        }
        Segundos4.innerHTML = ":" + segundos4;
    }
    if (segundos4 == 59) {
        segundos4 = -1;
    }
    if ((centesimas4 == 0) && (segundos4 == 0)) {
        minutos4++;
        if (minutos4 < 10) {
            minutos4 = "0" + minutos4
        }
        Minutos4.innerHTML = ":" + minutos4;
    }
    if (minutos4 == 59) {
        minutos4 = -1;
    }
    if ((centesimas4 == 0) && (segundos4 == 0) && (minutos4 == 0)) {
        horas4++;
        if (horas4 < 10) {
            horas4 = "0" + horas4
        }
        Horas4.innerHTML = horas4;
    }

    final4 = horas4 + ":" + minutos4 + ":" + segundos4 + ":" + centesimas4;
    return final4;
}

var centesimas5 = 0;
var segundos5 = 0;
var minutos5 = 0;
var horas5 = 0;
var final5 = 0;
function inicio5() {
    control5 = setInterval(cronometro5, 10);
    document.getElementById("inicio5").disabled = true;
    document.getElementById("parar5").disabled = false;
}
function parar5() {
    clearInterval(control5);
    document.getElementById("parar5").disabled = true;
}

function cronometro5() {
    if (centesimas5 < 99) {
        centesimas5++;
        if (centesimas5 < 10) {
            centesimas5 = "0" + centesimas5
        }
        Centesimas5.innerHTML = ":" + centesimas5;
    }
    if (centesimas5 == 99) {
        centesimas5 = -1;
    }
    if (centesimas5 == 0) {
        segundos5++;
        if (segundos5 < 10) {
            segundos5 = "0" + segundos5
        }
        Segundos5.innerHTML = ":" + segundos5;
    }
    if (segundos5 == 59) {
        segundos5 = -1;
    }
    if ((centesimas5 == 0) && (segundos5 == 0)) {
        minutos5++;
        if (minutos5 < 10) {
            minutos5 = "0" + minutos5
        }
        Minutos5.innerHTML = ":" + minutos5;
    }
    if (minutos5 == 59) {
        minutos5 = -1;
    }
    if ((centesimas5 == 0) && (segundos5 == 0) && (minutos5 == 0)) {
        horas5++;
        if (horas5 < 10) {
            horas5 = "0" + horas5
        }
        Horas5.innerHTML = horas5;
    }
    final5 = horas5 + ":" + minutos5 + ":" + segundos5 + ":" + centesimas5;
    return final5;
}



var centesimas6 = 0;
var segundos6 = 0;
var minutos6 = 0;
var horas6 = 0;
var final6 = 0;
function inicio6() {
    control6 = setInterval(cronometro6, 10);
    document.getElementById("inicio6").disabled = true;
    document.getElementById("parar6").disabled = false;
}
function parar6() {
    clearInterval(control6);
    document.getElementById("parar6").disabled = true;
}

function cronometro6() {
    if (centesimas6 < 99) {
        centesimas6++;
        if (centesimas6 < 10) {
            centesimas6 = "0" + centesimas6
        }
        Centesimas6.innerHTML = ":" + centesimas6;
    }
    if (centesimas6 == 99) {
        centesimas6 = -1;
    }
    if (centesimas6 == 0) {
        segundos6++;
        if (segundos6 < 10) {
            segundos6 = "0" + segundos6
        }
        Segundos6.innerHTML = ":" + segundos6;
    }
    if (segundos6 == 59) {
        segundos6 = -1;
    }
    if ((centesimas6 == 0) && (segundos6 == 0)) {
        minutos6++;
        if (minutos6 < 10) {
            minutos6 = "0" + minutos6
        }
        Minutos6.innerHTML = ":" + minutos6;
    }
    if (minutos6 == 59) {
        minutos6 = -1;
    }
    if ((centesimas6 == 0) && (segundos6 == 0) && (minutos6 == 0)) {
        horas6++;
        if (horas6 < 10) {
            horas6 = "0" + horas6
        }
        Horas6.innerHTML = horas6;
    }

    final6 = horas6 + ":" + minutos6 + ":" + segundos6 + ":" + centesimas6;
    return final6;
}

