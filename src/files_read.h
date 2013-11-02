int empty_file(FILE *p){
	int i;
	char c;
	c = fgetc(p);
	if ((c == EOF) || (c == '\n')){
		rewind(p);
		return 1;
	}
	rewind(p);
	return 0;
}

void check_files(){ 
	/*verifica se data e data/spaces/ existem, caso contrario cria*/
	system("mkdir data");
	system("mkdir data" slash "spaces");
	/*verifica se user.txt existe, caso contrario cria*/
	FILE *p;
	p = fopen("data/users.txt","r");
	if (p == NULL){
		p = fopen("data/users.txt","w");
	}
	fclose(p);
	/*verifica se spaces.txt existe, caso contrario cria*/
	p = fopen("data/spaces.txt","r");
	if (p == NULL){
		p = fopen("data/spaces.txt","w");
	}
	fclose(p);
}

void post_reservation(const char* string, char *space_name){
	char str[MAXLEN];
	strcpy(str,"data/spaces/");
	strcat(str,space_name);
	strcat(str,slash);
	strcat(str,string);
	strcat(str,".txt");

	FILE *p;
	p = fopen(str,"r");
	if (p == NULL) return;
	char c;
	int i=0, blocks=0;
	char *buffer;
	buffer = (char*)malloc(sizeof(char)*MAXLEN);

	int *dia, *mes, *ano;
	dia = (int*)malloc(sizeof(int));
	mes = (int*)malloc(sizeof(int));
	ano = (int*)malloc(sizeof(int));
	char a, b;
	sscanf(string,"%d%c%d%c%d",dia,&a,mes,&b,ano);
	user u;
	space s = findOrCreateSpace(space_name,0);

	date d = findOrCreateDate(s, *dia, *mes, *ano,0);

	while (1){
		c = fgetc(p);
		if (c == EOF){
			break;
		}
		if ((c == ',') || (c == '\n') || ( c == EOF)) {
				if (strlen(buffer) > 2) {
					if (sys == 1) u = findUser(buffer);
					else u = findOrCreateUser(buffer,0);
					if (u != NULL) makeReservation(u, s, d, blocks, 0);
				}
			reset_buffer(buffer,MAXLEN);
			if (c == '\n') blocks++;
			i = 0;
		}
		else {
			buffer[i] = c;
			i++;
		}
	}
	free(buffer);
	fclose(p);
	free(dia);
	free(mes);
	free(ano);
}

void load_reservations(char* string){
	/*obter as datas de cada espaço*/
	char str[MAXLEN];
	strcpy(str,"data" slash "spaces" slash);
	strcat(str,string);
	strcat(str,slash "dias.txt");

	FILE *days;
	days = fopen(str,"r");
	if (days == NULL) return;

	/*abrir a data de cada espaço*/
	char data[MAXLEN];
	reset_buffer(data,MAXLEN);
	while (1){
		fgets(data,MAXLEN+1,days);
		data[strlen(data)-1] = '\0';
		if (data[0] == '\0') break;
		post_reservation(data,string);
		reset_buffer(data,MAXLEN);
	}
	fclose(days);
	return;
}

void load(const char* type){
	int i=0;
	FILE *p;
	char *buffer;
	char c;
	
	if (type == "users") p = fopen("data/users.txt","r"); /*lista de utilizadores*/
	if (type == "spaces") p = fopen("data/spaces.txt","r"); /*lista de espaços*/
	if (empty_file(p)) return;

	buffer = (char*)malloc(sizeof(char)*MAXLEN);
	reset_buffer(buffer,MAXLEN);
	while(1){
		c = fgetc(p);
		if (c == EOF) break;
		if (c == '\n'){
			if (type == "users") newUser(buffer);
			if (type == "spaces") {
				create_spaceDir(buffer);
				newSpace(buffer);
				load_reservations(buffer);
			}
			reset_buffer(buffer,MAXLEN);
			i = 0;
		}
		else{
			buffer[i] = c;
			i++;
		}
	}
	free(buffer);
	fclose(p);
}

void load_database(){
	check_files();
	clear();
	load("users");
	load("spaces");
	return;
}