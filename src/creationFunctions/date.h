/*cria uma nova data para uma sala*/
date newDate(space s, int dia, int mes, int ano){
	int i;
	date d, anterior, seguinte;

	/*atribuir valores as variaves de d*/
	d = (date)malloc(sizeof(struct date_n));
	d->dia = dia;
	d->mes = mes;
	d->ano = ano;
	d->next = NULL;
	for(i = 0; i < 28; i++) d->rl[i] = NULL;

	/*colocar a data na lista de datas para a sala s, por ordem cronologica*/
	if(s->date == NULL) s->date = d;
	else if(compareDates(dia, mes, ano, s->date->dia, s->date->mes, s->date->ano) == -1){
		d->next = s->date;
		s->date = d;
	}
	else{
		anterior = s->date;
		seguinte = anterior->next;
		while((seguinte != NULL) && (compareDates(dia, mes, ano, seguinte->dia, seguinte->mes, seguinte->ano) > 0)){
			anterior = seguinte;
			seguinte = seguinte->next;
		}
		anterior->next = d;
		d->next = seguinte;
	}
	return d;
}


/*procura a data na lista da sala s, caso nao encontre devolve NULL*/
date findDate(space s, int dia, int mes, int ano){
	int v;
	date d;

	d = s->date;
	if(d == NULL) return NULL;
	while(1){
		v = compareDates(dia, mes, ano, d->dia, d->mes, d->ano);
		if(v == 0) return d;
		if(d->next == NULL || v == -1) return NULL;
		d = d->next;
	}
}


/*procura a data na lista da sala s e caso nao encontre cria uma nova*/
date findOrCreateDate(space s, int dia, int mes, int ano, int save){
	date d;
	d = findDate(s, dia, mes, ano);
	if(d == NULL){
		d = newDate(s, dia, mes, ano);
		if (save == 1) saveDate(s->id, d);
	}
	return d;
}