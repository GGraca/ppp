void clear(){
	if (sys == 1) system("cls");
	else system("clear");
	printf("\n");
}

int compareDates(int d1, int m1, int a1, int d2, int m2, int a2){
	if(a1>a2) return 1;
	else if(a1<a2) return -1;
	else{
		if(m1>m2) return 1;
		else if(m1<m2) return -1;
		else{
			if(d1>d2) return 1;
			else if(d1<d2) return -1;
			else return 0;
		}
	}
	
}

int compareDatesAndHoras(date d1, int h1, date d2, int h2){
	int i;
	i = compareDates(d1->dia, d1->mes, d1->ano, d2->dia, d2->mes, d2->ano);
	if(i != 0) return i;
	else{
		if(h1>h2) return 1;
		else if(h1<h2) return -1;
		else return 0;
	}
}

int isLeapYear(int year){
	if (year % 400 == 0) return 1;
	if (year % 100 == 0) return 0;
	if (year % 4 == 0) return 1;
	return 0;
}

int validTime(my_time input){
	time_t current = time(NULL);
	struct tm *t = localtime(&current);
	if (input.h > t->tm_hour)
		return 1;
	if (input.h == t->tm_hour)
		if (input.m >= (t->tm_min - 15)) return 1;
	return 0;
}


/*2 Data igual ao dia actual*/
/*1 Data válida/
/*0 Data apenas inválida*/
/*-1 - Data ja ultrapassada*/
int validDate(int dia, int mes, int ano){
	time_t current = time(NULL);
	struct tm *t = localtime(&current);
	int days_per_month[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	if (isLeapYear(ano)) days_per_month[1] = 29;
	if ((dia == t->tm_mday) && (mes == t->tm_mon+1) && (ano == t->tm_year+1900)) return 2;
	if (compareDates(dia+1, mes, ano, t->tm_mday, t->tm_mon+1, t->tm_year+1900) == 1){
		if ((mes > 0) && (mes <= 12)){
			if ((dia > 0) && (dia <= days_per_month[mes-1]))
				return 1;
			return 0;
		 }
		return 0;
	}
	/*data ultrapassada:*/
	if ((mes > 0) && (mes <= 12)){
			if ((dia > 0) && (dia <= days_per_month[mes-1]))
				return -1;
	}
	return 0;
}

int compareTime(my_time time1, my_time time2){
	if (time1.h < time2.h) return 1;
	if (time1.h == time2.h)
		if (time1.m < time2.m) return 1;
	return 0;
}

int validInterval(my_time time1, my_time time2){
	if ( (time1.h >=10) && (time1.h <=23) && (time2.h >=10) && (time2.h <= 24) && ((time1.m == 0) || (time1.m == 30)) && ((time2.m == 0) || (time2.m == 30))){
		if (compareTime(time1, time2)) return 1;
	}
	return 0;
}

void printBlock(int n){
	int m = 0;
	if (n % 2 != 0)	m = 3;
	n /= 2;
	n += 10;
	printf("%d:%d0",n,m);
}

void credits(){
	printf("\n\nRealizado por professionais:  André Baptista e Guilherme Graça\n\n");
	printf("Reviews:\n");
	printf(" «Que confusão!» - muita gente\n");
	printf(" «Isso é para o 20!» - as nossas mães\n");
	printf(" «Com arvores é que é de homem» - Michel \n");
	printf(" «Aposto que encontro já 10 bugs» - anónimo\n");
	printf(" «Ajuda-me no projecto» - anónimo\n\n");

	printf("Desenvolvimento:\n");
	printf(" «Com cores ficava mais bonito...»\n");
	printf(" «Boa estética, vamos copiar...»\n");
	printf(" «A cerveja tá a ficar quente...»\n");
	printf(" «Podiamos fazer um virus e mandar ao stor...»\n");
	printf(" «Random segfaults everywhere...»\n");
	printf(" «Com esta linha chegamos as 1000 linhas!!»\n");

	getchar();
	clear();
}