/*cria um novo user e adiciona ao fim da ul (lista de utilizadores)*/
user newUser(char *id){
	int i;
	user u;

	u = (user)malloc(sizeof(struct user_n));
	u->id = (char*)malloc(MAXLEN*sizeof(char));
	reset_buffer(u->id,MAXLEN);
	for(i = 0; id[i] != '\0'; i++) u->id[i] = id[i];
	u->rl = NULL;
	u->next = NULL;
	
	if(ul.first == NULL){
		ul.first = u;		
		ul.last = u;
	}
	else{
		ul.last->next = u;
		ul.last = u;
	}
	return u;
}


/*percorre a ul ate encontrar o user com o id dado. caso nao encontre devolve NULL*/
user findUser(char *id){
	user u;

	u = ul.first;
	if(u == NULL) {
		return NULL;
	}
	while(1){
		if(!strcmp(u->id, id)) return u;
		if(u->next == NULL) return NULL;
		u = u->next;
	}
}


/*procura o utilizador na ul e se nao encontrar pergunta se quer criar um utilizador com este id*/
user findOrCreateUser(char *id, int save){
	user u;

	u = findUser(id);
	if(u == NULL){
		printf(" O utilizador '%s' não existe. Quer que seja criado? (Y/n) ", id);
		if(ynInput()){
			u = newUser(id);
			if (save == 1) saveUser(id);
		}
		else return NULL;
	}
	return u;
}	