/*cria uma nova sala e adiciona ao fim da sl (lista de espaços)*/
space newSpace(char *id){
	int i;
	space s;

	s = (space)malloc(sizeof(struct space_n));
	s->id = (char*)malloc(MAXLEN*sizeof(char));
	reset_buffer(s->id,MAXLEN);
	for(i = 0; id[i] != '\0'; i++) s->id[i] = id[i];
	s->date = NULL;
	s->next = NULL;
	
	if(sl.first == NULL){
		sl.first = s;
		sl.last = s;
	}
	else{
		sl.last->next = s;
		sl.last = s;
	}
	return s;
}


/*percorre a sl ate encontrar a sala com o id dado. caso nao encontre devolve NULL*/
space findSpace(char *id){
	space s;
	s = sl.first;

	if(s == NULL) return NULL;
	while(1){
		if(!strcmp(s->id, id)) return s;
		if(s->next == NULL) return NULL;
		s = s->next;
	}
}


/*procura a sala na sl e se nao encontrar pergunta ao utilizador se quer criar uma sala com este id*/
space findOrCreateSpace(char *id, int save){
	space s;

	s = findSpace(id);
	if(s == NULL){
		printf(" O espaço '%s' não existe. Quer que seja criado? (Y/n) ", id);
		if(ynInput()){
			s = newSpace(id);
			if (save == 1) saveSpace(id);
		}
		else return NULL;
	}	
	return s;
}