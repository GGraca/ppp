/*aloca memoria e inicializa as variaveis para uma reserva*/
reservation newReservation(){
	reservation r;
	r = (reservation)malloc(sizeof(struct reservation_n));
	r->hora = -1;
	r->user = NULL;
	r->space = NULL;
	r->date = NULL;
	r->next_u_r = NULL;
	r->previous_u_r = NULL;
	r->next_b_r = NULL;
	r->previous_b_r = NULL;
	return r;
}


/*procura a reserva na lista de reservas do utilizador u, caso nao exista devolve NULL*/
reservation findReservation(user u, date d, int hora){
	reservation r;
	r = u->rl;
	if(r == NULL) return NULL;
	while(1){
		if(r->date == d  && r->hora == hora) return r;
		if(r->next_u_r == NULL) return NULL;
		r = r->next_u_r;
	}
}