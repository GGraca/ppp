# include "src/headers.h"

int main(){
	int n, noptions=6;

	load_database();
	clear();
	while (1){
		n = 0;
		printf(" ---| Menu principal |---\n\n");
		printf(" Introduza o número que corresponde à opção pretendida:\n");
		printf(" 1 - Reservar um espaço\n");
		printf(" 2 - Cancelar reserva ou pré-reserva\n");
		printf(" 3 - Listar reservas e pré-reservas de um espaço\n");
		printf(" 4 - Listar reservas e pré-reservas de um utilizador\n");
		printf(" 5 - Créditos\n");
		printf(" 9 - Sair\n\n -> ");
		while (1){
			scanf("%d",&n);
			stdinClear();
			if (((n>0) && (n<=noptions)) || (n==9)) break;
			printf(" Opção inválida\n\n -> ");
		}
		clear();
		if (n==9) break;
		else if (n==1) prepareReservation();
		else if (n==2) cancelReservation();
		else if (n==3) printDayReservations();
		else if (n==4) printUserReservations();
		else if (n==5) credits();	
	}
	clear();
	return 0;
}