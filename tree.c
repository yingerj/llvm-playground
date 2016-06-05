#include <stdio.h>
#include <stdlib.h>

typedef struct node node;

struct node {
  node *left;
  node *right;
  int label;
};

int main() {
    printf("hello llvm\n");

    node *root = malloc(sizeof(node));
    root->label = 1;
    printf("root label %i\n", root->label);
    return 0;
}
