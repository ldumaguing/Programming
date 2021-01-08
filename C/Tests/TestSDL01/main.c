#include <stdio.h>
#include <SDL2/SDL.h>

int main(int argc, char *argv[]) {
   /*
    * *************************************** TEST
   if (SDL_Init(SDL_INIT_VIDEO) != 0) {
     std::cout << "SDL_Init Error: " << SDL_GetError() << std::endl;
     return 1;
   }
   SDL_Quit();
   */
 
   if (SDL_Init(SDL_INIT_VIDEO) != 0) {
      printf("SDL_Init Error: 1\n");
      return 1;
   }

   SDL_Window *win = SDL_CreateWindow("Hello World!", 100, 100, 640, 480, SDL_WINDOW_SHOWN);
   if (win == NULL) {
      printf("SDL_Init Error: 2\n");
      SDL_Quit();
      return 1;
   }

   SDL_Renderer *ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
   if (ren == NULL) {
      SDL_DestroyWindow(win);
      printf("SDL_Init Error: 3\n");
      SDL_Quit();
      return 1;
   }

   char imagePath[] = "./fish.bmp";
   SDL_Surface *bmp = SDL_LoadBMP(imagePath);
   if (bmp == NULL) {
      SDL_DestroyRenderer(ren);
      SDL_DestroyWindow(win);
      printf("SDL_Init Error: 4\n");
      SDL_Quit();
      return 1;
   }

   SDL_Texture *tex = SDL_CreateTextureFromSurface(ren, bmp);
   SDL_FreeSurface(bmp);
   if (tex == NULL) {
      SDL_DestroyRenderer(ren);
      SDL_DestroyWindow(win);
      printf("SDL_Init Error: 5\n");
      SDL_Quit();
      return 1;
   }

   for (int i = 0; i < 3; ++i) {
      //First clear the renderer
      SDL_RenderClear(ren);
      //Draw the texture
      SDL_RenderCopy(ren, tex, NULL, NULL);
      //Update the screen
      SDL_RenderPresent(ren);
      //Take a quick break after all that hard work
      SDL_Delay(1000);
   }

   SDL_DestroyTexture(tex);
   SDL_DestroyRenderer(ren);
   SDL_DestroyWindow(win);
   SDL_Quit();

   return 0;
}
