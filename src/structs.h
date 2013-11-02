typedef struct reservation_n{
	int hora;
	struct user_n *user;
	struct space_n *space;
	struct date_n *date;

	struct reservation_n *next_u_r;
	struct reservation_n *previous_u_r;
	
	struct reservation_n *next_b_r;
	struct reservation_n *previous_b_r;
}*reservation;


/*------------------------------------*/
typedef struct date_n{
	int dia;
	int mes;
	int ano;
	struct reservation_n *rl[28];
	struct date_n *next;
}*date;


/*------------------------------------*/
typedef struct space_n{
	char *id;
	struct date_n *date;
	struct space_n *next;
}*space;

typedef struct{
	space first;
	space last;
}space_list;
space_list sl;


/*------------------------------------*/
typedef struct user_n{
	char *id;
	struct reservation_n *rl;
	struct user_n *next;
}*user;

typedef struct{
	user first;
	user last;
}user_list;
user_list ul;


/*------------------------------------*/
typedef struct my_time{
	int h;
	int m;
} my_time;