/*funcao que faz a transicao entre o input do utilizador e a funcao de atribuicao de reservas*/
void prepareReservation(){
	char *user_id;
	char *space_id;
	int *dia = (int*)malloc(sizeof(int));
	int *mes = (int*)malloc(sizeof(int));
	int *ano = (int*)malloc(sizeof(int));
	int block[2];
	int i;
	int actual;
	int v;
	int sobreposto = 0;

	user u;
	space s;
	date d;
	int block_i = 0;


	printf(" ---| Reservar espaço |---\n\n");
	printf(" Nome de utilizador: ");
	user_id = nameInput();	
	u = findOrCreateUser(user_id,1);
	if(u == NULL) return;

	printf("\n Nome do espaço: ");
	space_id = nameInput();
	s = findOrCreateSpace(space_id,1);
	if(s == NULL) return;

	/*se o dia for o actual , actual = 1*/
	actual = dateInput(dia, mes, ano);
	d = findOrCreateDate(s, *dia, *mes, *ano, 1);

	free(dia);
	free(mes);
	free(ano);
	if (actual == 1){
		time_t current = time(NULL);
		struct tm *t = localtime(&current);
		if (t->tm_hour >= 10){
			/*algoritmo do bloco*/
			block_i = (t->tm_hour-10) * 2;
			if (t->tm_min >= 15){
				if (t->tm_min < 45) block_i++;
				else block_i +=2; /*(tolerancia de 15 minutos)*/
			}
		}
	}


	clear();
	printDay(s, d, block_i); /*por cores e corrigir bloco inicial + espacos iguais*/
	timeInput(block, actual);

	for(i=block[0]; i<=block[1]; i++){
		v = checkReservation(u, s, d, i);
		if(v == 1){
			clear();
			printf(C_RED " Esta reserva coincide com a sua agenda.\n\n" C_NRM);
			return;
		}
		else if(v == 2)	sobreposto = 1;
	}
	
	if(sobreposto){
		stdinClear();
		printf(" Ficará a aguardar que alguns blocos fiquem disponiveis. Continuar? (Y/n) ");
		if(!ynInput()) return;
	}

	for(i=block[0]; i<=block[1]; i++) makeReservation(u, s, d, i, 1);
	feedBack(1);
}


/*funcao que faz a transicao entre o input do utilizador e a funcao para remover reservas*/
void cancelReservation(){
	char *user_id;
	char *space_id;
	int *dia = (int*)malloc(sizeof(int));
	int *mes = (int*)malloc(sizeof(int));
	int *ano = (int*)malloc(sizeof(int));
	int block[2];
	int i;

	reservation r;
	user u;
	space s;
	date d;


	printf(" ---| Cancelar reserva ou pré-reserva |---\n\n");
	printf(" Nome de utilizador: ");
	user_id = nameInput();
	u = findUser(user_id);
	if(u == NULL){
		feedBack(0);
		printf(C_RED " O utilizador nao se encontra na base de dados.\n\n" C_NRM);
		return;
	}

	printf("\n Nome do espaço: ");
	space_id = nameInput();
	s = findSpace(space_id);
	if(s == NULL){
		feedBack(0);
		printf(C_RED " O espaço não se encontra na base de dados.\n\n" C_NRM );
		return;
	}

	dateInput(dia, mes, ano);
	d = findDate(s, *dia, *mes, *ano);
	if(d == NULL){
		feedBack(0);
		printf(C_RED " O espaço não tem reservas para esse dia.\n\n" C_NRM );
		return;
	}

	printf("\n");
	printDay(s, d, 0);
	timeInput(block,0);

	for(i=block[0]; i<=block[1]; i++){
		r = findReservation(u, d, i);
		if(r != NULL) deleteReservation(r);
	}

	free(dia);
	free(mes);
	free(ano);
	feedBack(1);
}

/*funcao que chama a funcao printDay de acordo com as escolhas do utilizador*/
void printDayReservations(){
	char *space_id;
	int dia;
	int mes;
	int ano;

	space s;
	date d;
	printf(" ---| Listar reservas e pré-reservas de um espaço |---\n\n");
	printf(" Nome do espaço: ");
	space_id = nameInput();
	s = findOrCreateSpace(space_id,0);
	if(s == NULL) return;

	printf("\n Data(dd mm aaaa): ");
	scanf("%d%d%d", &dia, &mes, &ano);
	if (validDate(dia,mes,ano) == 0) {
		clear();
		printf(C_RED " Data inválida.\n\n" C_NRM);
		return;
	}
	d = findOrCreateDate(s, dia, mes, ano,0);
	printf("\n");
	printDay(s, d, 0);
	stdinClear();
	getchar();
	clear();
}


/*funcao que permite listar todas as reservas de um utilizador por ordem cronologica*/
void printUserReservations(){
	int tipo;
	char *user_id;
	user u;
	reservation r;
	date d;
	int h;

	printf(" ---| Listar " C_GRN "reservas" C_NRM " e " C_RED "pré-reservas" C_NRM " de um utilizador |---\n\n");
	printf(" Nome de utilizador: ");
	user_id = nameInput();
	u = findUser(user_id);
	if(u == NULL){
		clear();
		printf(C_RED " O utilizador nao se encontra na base de dados. \n\n" C_NRM);
		return;
	}

	r = u->rl;
	if(u->rl == NULL){
		clear();
		printf(" O utilizador nao tem reservas neste momento.\n\n ");
		return;
	}
	else{
		d = r->date;
		h = r->hora;
		printf("\n %d/%d/%d ", d->dia, d->mes, d->ano);
		printBlock(h);
		printf("-");

		while(1){
			if(r->next_u_r == NULL){
				printBlock(h + 1);
				printf(" -> ");
				if(r->previous_b_r == NULL) printf(C_GRN);
				else printf(C_RED);
				printf("%s", r->space->id);
				printf(C_NRM "\n");
				break;
			}

			if(r->next_u_r->date != d || (r->next_u_r->hora - h) > 1 || (r->next_u_r->previous_b_r == NULL && r->previous_b_r != NULL)|| (r->next_u_r->previous_b_r != NULL && r->previous_b_r == NULL)){
				printBlock(h + 1);
				printf(" -> ");
				if(r->previous_b_r == NULL) printf(C_GRN);
				else printf(C_RED);
				printf("%s", r->space->id);
				printf(C_NRM "\n");

				printf(" %d/%d/%d ", r->next_u_r->date->dia, r->next_u_r->date->mes, r->next_u_r->date->ano);
				printBlock(r->next_u_r->hora);
				printf("-");
			}
			r = r->next_u_r;
			d = r->date;
			h = r->hora;
		}
	}
	printf(" ");
	feedBack(0);
}
