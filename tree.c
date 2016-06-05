#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct node node;

struct node {
  node *left;
  node *right;
  int label;
};

node* new_node(int label) {
  node* n = malloc(sizeof(node));
  n->left = NULL;
  n->right = NULL;
  n->label = label;
  return n;
}

bool rand_bool() {
  return (bool)(rand()%2);
}

void add_node_rand(node* root, int label) {
  if(rand_bool()) {
    if(root->left) {
      add_node_rand(root->left, label);
    }
    else {
      root->left = new_node(label);
    }
  }
  else {
    if(root->right) {
      add_node_rand(root->right, label);
    }
    else {
      root->right = new_node(label);
    }
  }
}

node* gen_tree(int num_nodes) {
  node* root = new_node(0);
  for(int i=1; i<(num_nodes-1); i++) {
    add_node_rand(root, i);
  }
  return root;
}


int main() {
  printf("hello llvm, meet tree\n");
  node* root = gen_tree(10);
  return 0;
}
