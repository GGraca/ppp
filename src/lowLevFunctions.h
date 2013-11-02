/*devolve 0 se for uma reserva limpa, 1 se o utilizador ja tiver reservas para essa hora,
 2 para o caso de ser pre-reserva e 3 para o caso de o utilizador ja ter reserva a essa hora nessa sala*/
int checkReservation(user u, space s, date d, int hora){
	int v = 0;
	reservation temp;

	/*check userReservations*/
	temp = u->rl;
	while(1){
		if(temp == NULL) break;
		v = compareDatesAndHoras(d, hora, temp->date, temp->hora);
		if(v < 0) break;
		else if(v == 0){
			if(temp->space->id == s->id) return 3;
			else return 1;
		}
		temp = temp->next_u_r;
	}

	/*check dateReservations*/
	if(d->rl[hora] == NULL)	return 0;
	else return 2;
}


/*encontra posicao na lista de reservas do utilizador por ondem cronologica e coloca-a no seu sitio
caso ja haja reserva nao faz nada*/
int addReservationToUser(user u, reservation r){
	reservation anterior;
	reservation seguinte;

	if(u->rl == NULL) u->rl = r;
	else if(compareDatesAndHoras(r->date, r->hora, u->rl->date, u->rl->hora) == -1){
		r->next_u_r = u->rl;
		u->rl = r;
	}
	else{
		anterior = u->rl;
		seguinte = anterior->next_u_r;
		
		while(1){
			if(compareDatesAndHoras(r->date, r->hora, anterior->date, anterior->hora) == 0) return 0;
			if(seguinte == NULL) break;
			if(compareDatesAndHoras(r->date, r->hora, seguinte->date, seguinte->hora) == -1) break;
			anterior = seguinte;
			seguinte = seguinte->next_u_r;
		}
		anterior->next_u_r = r;
		r->next_u_r = seguinte;
		r->previous_u_r = anterior;
	}
	return 1;
}


/*poe a reserva na ultima posicao da fila de reservas para uma certa sala e dia*/
void addReservationToDate(date d, int hora, reservation r){
	reservation temp;

	if(d->rl[hora] == NULL)	d->rl[hora] = r;
	else{
		temp = d->rl[hora];

		while(temp->next_b_r != NULL) temp = temp->next_b_r;
		temp->next_b_r = r;
		r->previous_b_r = temp;
	}
}


/*cria a reserva e chama funcoes para a colocar na posicao correcta das listas (user e data)*/
void makeReservation(user u, space s, date d, int hora, int save){
	reservation r;

	r = newReservation();
	r->hora = hora;
	r->user = u;
	r->space = s;
	r->date = d;

	if(addReservationToUser(u, r)){
		addReservationToDate(d, hora, r);
		if (save == 1) saveReservation(r);
	}
}


/*remove a reserva da lista do utilizador e da lista de reservas onde se encontrava*/
void deleteReservation(reservation r){
	if(r == NULL) return;
	
	/*remove from file*/
	fdelete(r);

	/*remove reservation from user*/
	if(r->previous_u_r == NULL && r->next_u_r == NULL) r->user->rl = NULL;
	else if(r->next_u_r == NULL) r->previous_u_r->next_u_r = NULL;
	else if(r->previous_u_r == NULL){
		r->next_u_r->previous_u_r = NULL;
		r->user->rl = r->next_u_r;
	}
	else{
		r->next_u_r->previous_u_r = r->previous_u_r;
		r->previous_u_r->next_u_r = r->next_u_r;
	}

	/*remove reservation from date*/
	if(r->previous_b_r == NULL && r->next_b_r == NULL) r->date->rl[r->hora] = NULL;
	else if(r->next_b_r == NULL) r->previous_b_r->next_b_r = NULL;
	else if(r->previous_b_r == NULL){
		r->next_b_r->previous_b_r = NULL;
		r->date->rl[r->hora] = r->next_b_r;
	}
	else{
		r->next_b_r->previous_b_r = r->previous_b_r;
		r->previous_b_r->next_b_r = r->next_b_r;
	}
	free(r);
}



/*imprime todos os blocos de 30 min das 10h as 24h com todas as reservas e pre-reservas que contem*/
void printDay(space s, date d, int a){
	int i;
	int t1, t2;
	reservation r;


	printf(" Espaço: %s\n Data: %d/%d/%d\n\n", s->id, d->dia, d->mes, d->ano);
	printf(" Horas       | Utilizadores\n");
	for(i = a; i < 28; i++){

		if(d->rl[i] == NULL) printf(C_GRN);

		printf(" ");
		printBlock(i);
		printf("-");
		printBlock(i+1);
		printf(" | ");

		if(d->rl[i] != NULL){
			r = d->rl[i];
			
			while(r != NULL){
				if(r->next_b_r == NULL) printf("%s", r->user->id ); 
				else printf("%s - ", r->user->id );
				r = r->next_b_r;
			}
		}
		printf(C_NRM "\n");
	}
	printf("\n ");
}
