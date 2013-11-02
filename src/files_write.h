void create_spaceDir(const char* string){
	char str[MAXLEN];
	strcpy(str,"mkdir data" slash "spaces" slash);
	strcat(str,string);
	system(str);
}


void saveUser(char *id){
	FILE *f;

	/*adiciona o novo utilizador (id) a users.txt*/
	f = fopen("data/users.txt", "a");
	fprintf(f,"%s\n", id);
	fclose(f);
}

void saveSpace(char *id){
	FILE *f;
	char string[100];

	/*adicionar espaco ao spaces.txt e criar a pasta para o novo dia*/
	f = fopen("data/spaces.txt", "a");
	fprintf(f,"%s\n", id);
	fclose(f);
	create_spaceDir(id);


	/*cria o ficheiro dias.txt na nova pasta*/
	strcpy(string, "data/spaces/");
	strcat(string, id);
	strcat(string, "/dias.txt");
	f = fopen(string, "w");
	fclose(f);
}

int dateNotIn(FILE *f,int dia, int mes, int ano){
	char *line = (char*)malloc(sizeof(char)*10);
	char *string = (char*)malloc(sizeof(char)*10);
	char c;
	int i=0;
	sprintf(string,"%d-%d-%d",dia,mes,ano);
	while (1){
		c = fgetc(f);
		if (c == EOF) break;
		if (c == '\n') {
			if (!strcmp(line,string)) {
				free(line);
				free(string);
				return 0;
				}
			i=0;
		}
		else {
			line[i] = c;
			i++;
		}
	}
	free(line);
	free(string);
	return 1;
}

void saveDate(char* sala_id, date d){
	FILE *f;
	char path_1[100];
	char path_2[100];
	char value[15];
	int i;

	/*adicionar a data a lista de datas para cada sala (dias.txt)*/
	strcpy(path_1, "data/spaces/");
	strcat(path_1, sala_id);
	strcpy(path_2, path_1);
	strcat(path_1, "/dias.txt");
	f = fopen(path_1,"w");
	fclose(f);
	f = fopen(path_1, "r+");
	if (dateNotIn(f,d->dia, d->mes, d->ano)){
		fprintf(f,"%d-%d-%d\n", d->dia, d->mes, d->ano);
	}
	fclose(f);

	/*criar o ficheiro para este dia*/
	sprintf(value, "%d-%d-%d", d->dia, d->mes, d->ano);
	strcat(path_2, "/");
	strcat(path_2, value);
	strcat(path_2, ".txt");
	f = fopen(path_2, "w");
	for(i = 0; i < 28; i++) fprintf(f, "\n");
	fclose(f);
}

int insert_buffer(char *buffer, const char *string, int index){
	int i = 0;
	while (string[i] != '\0'){
		buffer[index] = string[i];
		i++;
		index++;
	}
	return index;
}

int fsize(FILE *p){
	char c;
	int i = 0;
	while (1){
		c = fgetc(p);
		i++;
		if (c==EOF) break;
	}
	rewind(p);
	return i;
}

/*---------- save reservation:*/

void fAddUser(FILE *f, const char *name, int line){
	if (line == 0) return;

	int lines = 0, i = 0;
	char *buffer, c;
	int my_size = fsize(f)+28*strlen(name);
	buffer = (char*)malloc(sizeof(char)*my_size);
	reset_buffer(buffer,my_size);
	while (1){
		if (lines == line) break;
		buffer[i] = fgetc(f);
		if (buffer[i] == '\n') lines++;
		if (buffer[i] == EOF) break;
		i++;
	}

	if (buffer[i-2] != '\n') buffer[i-1] = ',';
	else i--;
	i = insert_buffer(buffer,name,i);
	buffer[i] = '\n';
	i++;

	while (1){
		c = fgetc(f);
		if (c == EOF) break;
		buffer[i] = c;
		i++;
	}
	rewind(f);
	fprintf(f,"%s",buffer);
	free(buffer);
}

void saveReservation(reservation r){
	FILE *f;
	char path[100];

	sprintf(path, "data/spaces/%s/%d-%d-%d.txt", r->space->id, r->date->dia, r->date->mes, r->date->ano);
	f = fopen(path, "r+");
	if (f == NULL) return;
	fAddUser(f,r->user->id,r->hora + 1);
	fclose(f);
	return;
}


/*---------- delete reserdatvation:*/

int find(const char *string1, const char* string2){
	int index = 0, i=0, x=0, boolean=0;
	char a=32;
	while (a!='\0'){
		x = 0;
		boolean = 0;
		a = string1[i];
		if (string2[0] == a){
			for (x=0;x<strlen(string2);x++){
				if (string1[x+i] == string2[x]) boolean = 1;
				else boolean = 0;
			}
		}
		if (boolean == 1) return i;
		i++;
	}
	return -1;
}

void fRemoveUser(const char *path, const char *name, int line){
	FILE *f;
	if (line == 0) return;
	f = fopen(path, "r");
	if (f == NULL) return;

	int lines = 0, i = 0, j = 0, index, comma=0;
	char *buffer, *bufferline, c;
	buffer = (char*)malloc(sizeof(char)*(fsize(f)-strlen(name)));
	bufferline = (char*)malloc(sizeof(char)*1000);
	reset_buffer(buffer,fsize(f)-strlen(name));

	while (1){
		if (lines == line-1) break;
		buffer[i] = fgetc(f);
		if (buffer[i] == '\n') lines++;
		if (buffer[i] == EOF) break;
		i++;
	}

	fgets(bufferline,501,f);
	index = find(bufferline,name);
	if (index == -1) return;

	if (strlen(bufferline)-1 == strlen(name)) fseek(f,-1,SEEK_CUR);
	else{
	if (index > 0) comma = 1;
	
	/*copia a linha toda excepto o nome:*/
	while (1){
		if (bufferline[j] == '\0') break;
		if (j == index - comma) {
			j+=strlen(name)+1;
		}
		buffer[i] = bufferline[j];
		i++;
		j++;
	}
	}
	/*coloca o resto no buffer*/
	while (1){
		c = fgetc(f);
		if (c == EOF) break;
		buffer[i] = c;
		i++;
	}

	fclose(f);
	f = fopen(path, "w");
	fprintf(f,"%s",buffer);
	free(buffer);
	free(bufferline);
	fclose(f);
}

void fdelete(reservation r){
	char path[100];
	sprintf(path, "data/spaces/%s/%d-%d-%d.txt", r->space->id, r->date->dia, r->date->mes, r->date->ano);
	fRemoveUser(path,r->user->id,r->hora + 1);
}