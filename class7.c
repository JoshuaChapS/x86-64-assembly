#include <stdio.h>
#include <elf.h>
#include <stdlib.h>

int main(void) {
    FILE *file = fopen("class6", "rb");
    
    if (file == NULL) return -1;

    size_t size = sizeof(Elf64_Ehdr);
    unsigned char buffer[size];

    size_t got = fread(buffer, 1, size, file);
    if (got != size) return -1;

    Elf64_Ehdr *header = (Elf64_Ehdr *) buffer;

    printf("Entry: %lx\n", header->e_entry);
    printf("Phoff: %lx\n", header->e_phoff);
    printf("Phnum: %u\n", header->e_phnum);

    fclose(file);

    return 0;
}