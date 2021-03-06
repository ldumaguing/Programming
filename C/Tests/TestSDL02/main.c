#include <SDL2/SDL.h>
#include <stdio.h>

const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;

_Bool init();
_Bool loadMedia();
void close();

SDL_Window *gWindow = NULL;
SDL_Surface *gScreenSurface = NULL;
SDL_Surface *gHelloWorld = NULL;

_Bool init() {
   _Bool success = 1;

   if (SDL_Init(SDL_INIT_VIDEO) < 0) {
      printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
      success = 0;
   }
   else {
      //Create window
      gWindow = SDL_CreateWindow("SDL Tutorial", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN);
      if (gWindow == NULL) {
         printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
         success = 0;
      }
      else {
         //Get window surface
         gScreenSurface = SDL_GetWindowSurface(gWindow);
      }
   }

   return success;
}

_Bool loadMedia() {
   _Bool success = 1;

   //Load splash image
   gHelloWorld = SDL_LoadBMP("./hello_world.bmp");
   if (gHelloWorld == NULL) {
      printf("Unable to load image %s! SDL Error: %s\n", "02_getting_an_image_on_the_screen/hello_world.bmp", SDL_GetError());
      success = 0;
   }

   return success;
}

void close() {
   //Deallocate surface
   SDL_FreeSurface(gHelloWorld);
   gHelloWorld = NULL;

   //Destroy window
   SDL_DestroyWindow(gWindow);
   gWindow = NULL;

   //Quit SDL subsystems
   SDL_Quit();
}

int main(int argc, char *args[]) {
   //Start up SDL and create window
   if (!init()) {
      printf("Failed to initialize!\n");
   }
   else {
      //Load media
      if (!loadMedia()) {
         printf("Failed to load media!\n");
      }
      else {
         //Apply the image
         SDL_BlitSurface(gHelloWorld, NULL, gScreenSurface, NULL);

         //Update the surface
         SDL_UpdateWindowSurface(gWindow);

         //Wait two seconds
         SDL_Delay(2000);
      }
   }

   //Free resources and close SDL
   close();

   return 0;
}
