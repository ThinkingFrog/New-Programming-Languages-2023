#include <stdio.h>
#include "lua.h"
#include "lauxlib.h"

static void stackDump (lua_State *L) {
    int i;
    int top = lua_gettop(L); /* глубина стека */
    for (i = 1; i <= top; i++) { /* повторяет для каждого уровня */
        int t = lua_type(L, i);
        printf("type: %s | ", lua_typename(L, t));
        switch (t) {
            case LUA_TSTRING: { /* строки */
                printf("'%s'\n", lua_tostring(L, i));
                break;
            }
            case LUA_TBOOLEAN: { /* булевы значения */
                printf(lua_toboolean(L, i) ? "true\n" : "false\n");
                break;
            }
            case LUA_TNUMBER: { /* числа */
                printf("%g\n", lua_tonumber(L, i));
                break;
            }
            default: { /* другие значения */
                printf("\n");
                break;
            }
        }
    }
}

int main (void) {
    lua_State *L = luaL_newstate ();
    lua_pushboolean (L, 1);
    lua_pushnumber (L, 10);
    lua_pushnil(L);
    lua_pushstring (L, "hello");
    stackDump(L);
    /*
    type: boolean | true
    type: number | 10
    type: nil |
    type: string | 'hello'
     */
    lua_close(L);
    return 0;
}
