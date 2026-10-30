#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int id;
    const char *name;
} User;

static User alice = {1, "Alice"};

static const User *find_user(int id)
{
    return id == alice.id ? &alice : NULL;
}

static void show_user(const User *user)
{
    /* Intentional bug: find_user() can return NULL. */
    printf("id=%d, name=%s\n", user->id, user->name);
}

int main(int argc, char **argv)
{
    /* Keep argument parsing simple; use 1 or 404 for this lab. */
    int id = argc > 1 ? atoi(argv[1]) : 404;
    const User *user = find_user(id);
    show_user(user);
    return 0;
}
