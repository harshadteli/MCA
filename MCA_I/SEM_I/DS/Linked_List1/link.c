#include<stdio.h>
#include<stdlib.h>
struct node
{
int data;
struct node *next;
};
int main(){
int num,digit;
struct node *head=NULL,*temp,*newnode;
printf("Enter Number:");
scanf("%d",&num);
int div=1;
while(num/div>=10){
div=div*10;
}
while(div>0){
digit=num/div;
num=num%div;
div=div/10;
newnode = malloc(sizeof(struct node));
newnode->data=digit;
newnode->next=NULL;
if(head==NULL){
head=newnode;
}else{
temp->next=newnode;
}
temp=newnode;
}
printf("Linked List:");
temp=head;
while(temp!=NULL){
printf("%d",temp->data);
if(temp->next!=NULL){
printf("-->");
}
temp=temp->next;
}
return 0;
}