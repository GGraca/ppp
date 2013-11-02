void stdinClear(){
	char c;
	while ((c = getchar()) != '\n' && c != EOF);
}

void reset_buffer(char *buffer, int len){
	int i;
	for (i=0;i<len;i++){
		buffer[i] = '\0';
	}
}

void feedBack(int i){
	stdinClear();
	clear();
	if(i == 0) return;
	else if (i == 1) printf(C_GRN " Operação concluída com sucesso.\n\n" C_NRM);
	else if (i == 2) printf(C_RED " Operação cancelada.\n\n" C_NRM);
}

int ynInput(){
	char i;
	i = fgetc(stdin);
	if(i == '\n') return 1;
	else if(i == 'y' || i == 'Y'){
		stdinClear();
		return 1;
	}
	else{
		clear();
		feedBack(2);
		return 0;
	}
}

void removeCommas(char *n){
	int i=0;
	while (n[i] != '\0'){
		if ((n[i]) == ',')
			n[i] = ' ';
		i++;
	}
}

char* nameInput(){
	char *n;
	n = (char*)malloc(sizeof(char)*MAXLEN);
	reset_buffer(n,MAXLEN);
	fgets(n,MAXLEN+1,stdin);
	n[strlen(n)-1] = '\0'; /*remover \n*/
	removeCommas(n); /*proteger a introducao de virgulas, o que iria adicionar dois utilizadores para a mesma data*/
	if (strlen(n) >= MAXLEN-1) stdinClear();
	return n;
}

int dateInput(int *dia, int *mes, int *ano){
	while(1){
		printf("\n Data(dd mm aaaa): ");
		scanf("%d%d%d", dia, mes, ano);
		stdinClear();
		if(validDate(*dia, *mes, *ano) == 1) return 0;
		/*caso seja 2, dia = actual, verifica se a hora ja foi ultrapassada*/
		if(validDate(*dia, *mes, *ano) == 2) {
			return 1;
		}
		if(validDate(*dia,*mes,*ano) == 0) printf(C_RED " Data inválida.\n" C_NRM );
		else printf(C_RED " Ainda não existem máquinas do tempo.\n" C_NRM );
	}
}

void timeInput(int array[], int actual){
	my_time time1, time2;
	char c1, c2, c3;
	while(1){
		printf("Horário (horas:minutos-horas:minutos): ");
		scanf("%d %c %d %c %d %c %d", &time1.h, &c1, &time1.m, &c2, &time2.h, &c3, &time2.m);
		if (validInterval(time1, time2)) {
			if (actual == 1){
				if (validTime(time1)) break;
			}
			else break;
		}
		stdinClear();
		printf(C_RED " Hora inválida. " C_NRM );
	}
	/*algoritmo para os blocos*/
	array[0] = (time1.h-10) * 2;
	if(time1.m == 30) array[0] += 1;
	array[1] = (time2.h-10) * 2;
	if(time2.m == 30) array[1] += 1;
	array[1] -= 1;
}