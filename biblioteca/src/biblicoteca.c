#include <stdio.h>
typedef struct _book
{
    int id;
    char title[100];
    char author[100];
    int publication_year;
    // TODO; agregar genero del libro
    int quantity;
} book_t;
typedef struct _member
{
    int id;
    char name[100];
    int bookIsuued;
} member_t;

void addBook()
{
    printf("Anadiendo un libro\n");
}

void displayBooks()
{
    printf("Mostrando los libros dispnibles en la bibiloteca\n");
}

void addMemmber()
{
    printf("Anadiendo un miembro\n");
}

int main()
{

    int x;
    do
    {
        printf("\nMenu de sistema de manejo de biblioteca\n");
        printf("\t1.- Agregar un libro\n");
        printf("\t2.- Monstrar libros disponibiles\n");
        printf("\t3.- Agregar un miembro\n");
        printf("\t4.- Prestar libro\n");
        printf("\t5.- Salir\n");
        scanf("%d", &x);

        switch (x)
        {
        case 1:
            // Addbook();
            break;
        case 2:
            // displayBooks();

            break;
        case 3:
            // addmember();
            break;
        case 4:
            // sharebook();
            break;

        case 5:
            printf("Saliendo del programa...\n");

        default:
            printf("Esta no es una opción valida:\n");
            break;
        }
    } while (x != 5);

    return 0;
}