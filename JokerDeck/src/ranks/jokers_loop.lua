SMODS.current_mod.custom = SMODS.current_mod.custom or {}
SMODS.current_mod.custom.joker_deck = SMODS.current_mod.custom.joker_deck or {}
SMODS.current_mod.custom.joker_deck.jokers = SMODS.current_mod.custom.joker_deck.jokers or {}

SMODS.current_mod.custom.joker_deck.jokers["Joker"] =                       {pos = {x = 0, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            ret = {
                mult = 4
            }
        }
    }}}
SMODS.current_mod.custom.joker_deck.jokers["Chaos the Clown"] =             {pos = {x = 1, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            held = true,
            create_tag = {"tag_d_six"}
        }
    }}}
SMODS.current_mod.custom.joker_deck.jokers["Jolly Joker"] =                 {pos = {x = 2, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            conditions = {
                contain_hand = "Pair"
            },
            ret = {
                mult = 8
            }
        },
        {
            held = true,
            conditions = {
                contain_hand = "Pair"
            },
            ret = {
                h_mult = 8
            }
        }
    }}}
SMODS.current_mod.custom.joker_deck.jokers["Zany Joker"] =                  {pos = {x = 3, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Mad Joker"] =                   {pos = {x = 4, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Crazy Joker"] =                 {pos = {x = 5, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Droll Joker"] =                 {pos = {x = 6, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Half Joker"] =                  {pos = {x = 7, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Merry Andy"] =                  {pos = {x = 8, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Stone Joker"] =                 {pos = {x = 9, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

SMODS.current_mod.custom.joker_deck.jokers["Juggler"] =                     {pos = {x = 0, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Drunkard"] =                    {pos = {x = 1, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Acrobat"] =                     {pos = {x = 2, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Sock and Buskin"] =             {pos = {x = 3, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Mime"] =                        {pos = {x = 4, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Credit Card"] =                 {pos = {x = 5, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Greddy Joker"] =                {pos = {x = 6, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Lusty Joker"] =                 {pos = {x = 7, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Wrathful Joker"] =              {pos = {x = 8, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Gluttonous Joker"] =            {pos = {x = 9, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

SMODS.current_mod.custom.joker_deck.jokers["Troubadour"] =                  {pos = {x = 0, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Banner"] =                      {pos = {x = 1, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Mystic Summit"] =               {pos = {x = 2, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Marble Joker"] =                {pos = {x = 3, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Loyalty Card"] =                {pos = {x = 4, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Hack"] =                        {pos = {x = 5, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Midprint"] =                    {pos = {x = 6, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Steel Joker"] =                 {pos = {x = 7, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Raised Fist"] =                 {pos = {x = 8, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Golden Joker"] =                {pos = {x = 9, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

SMODS.current_mod.custom.joker_deck.jokers["Blueprint"] =                   {pos = {x = 0, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Glass Joker"] =                 {pos = {x = 1, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Scary Face"] =                  {pos = {x = 2, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Abstract Joker"] =              {pos = {x = 3, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Delayed Gratification"] =       {pos = {x = 4, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Golden Ticket"] =               {pos = {x = 5, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Pareidolia"] =                  {pos = {x = 6, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Cartomancer"] =                 {pos = {x = 7, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Even Steven"] =                 {pos = {x = 8, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Odd Todd"] =                    {pos = {x = 9, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

SMODS.current_mod.custom.joker_deck.jokers["Scholar"] =                     {pos = {x = 0, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Business Card"] =               {pos = {x = 1, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Supernova"] =                   {pos = {x = 2, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Mr. Bones"] =                   {pos = {x = 3, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Seing Double"] =                {pos = {x = 4, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["The Duo"] =                     {pos = {x = 5, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["The Trio"] =                    {pos = {x = 6, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["The Family"] =                  {pos = {x = 7, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["The Order"] =                   {pos = {x = 8, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["The Tribe"] =                   {pos = {x = 9, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

SMODS.current_mod.custom.joker_deck.jokers["8 Ball"] =                      {pos = {x = 0, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Fibonacci"] =                   {pos = {x = 1, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Joker Stencil"] =               {pos = {x = 2, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Space Joker"] =                 {pos = {x = 3, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Matador"] =                     {pos = {x = 4, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Ceremonial Dagger"] =           {pos = {x = 5, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Showman"] =                     {pos = {x = 6, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Fortune Teller"] =              {pos = {x = 7, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Hit the Road"] =                {pos = {x = 8, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Swashbuckler"] =                {pos = {x = 9, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

SMODS.current_mod.custom.joker_deck.jokers["Flower Pot"] =                  {pos = {x = 0, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Ride the Bus"] =                {pos = {x = 1, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Shoot the Moon"] =              {pos = {x = 2, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

SMODS.current_mod.custom.joker_deck.jokers["Smeared Joker"] =               {pos = {x = 4, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Oops! All 6s"] =                {pos = {x = 5, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Four Fingers"] =                {pos = {x = 6, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Gros Michel"] =                 {pos = {x = 7, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Stuntman"] =                    {pos = {x = 8, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Hanging Chad"] =                {pos = {x = 9, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

SMODS.current_mod.custom.joker_deck.jokers["Driver's License"] =            {pos = {x = 0, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Invisible Joker"] =             {pos = {x = 1, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Astronomer"] =                  {pos = {x = 2, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Burnt Joker"] =                 {pos = {x = 3, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Dusk"] =                        {pos = {x = 4, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Throwback"] =                   {pos = {x = 5, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["The Idol"] =                    {pos = {x = 6, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Brainstorm"] =                  {pos = {x = 7, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Satellite"] =                   {pos = {x = 8, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Rough Gem"] =                   {pos = {x = 9, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

SMODS.current_mod.custom.joker_deck.jokers["Bloodstrone"] =                 {pos = {x = 0, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Arrowhead"] =                   {pos = {x = 1, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Onyx Agate"] =                  {pos = {x = 2, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
-- SMODS.current_mod.custom.joker_deck.jokers["Player"] =                      {pos = {x = 3, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
-- SMODS.current_mod.custom.joker_deck.jokers["Proud Joker"] =                 {pos = {x = 4, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
-- SMODS.current_mod.custom.joker_deck.jokers["Patch"] =                       {pos = {x = 5, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
-- SMODS.current_mod.custom.joker_deck.jokers["Umbrella"] =                    {pos = {x = 6, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
-- SMODS.current_mod.custom.joker_deck.jokers["AI"] =                          {pos = {x = 7, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Certificate"] =                 {pos = {x = 8, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Bootstraps"] =                  {pos = {x = 9, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

-- SMODS.current_mod.custom.joker_deck.jokers["The Cow"] =                     {pos = {x = 0, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
-- SMODS.current_mod.custom.joker_deck.jokers["Autumn"] =                      {pos = {x = 1, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
-- SMODS.current_mod.custom.joker_deck.jokers["Prime"] =                       {pos = {x = 2, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Caino"] =                       {pos = {x = 3, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Triboulet"] =                   {pos = {x = 4, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Yorick"] =                      {pos = {x = 5, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Chicot"] =                      {pos = {x = 6, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Perkeo"] =                      {pos = {x = 7, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

SMODS.current_mod.custom.joker_deck.jokers["Egg"] =                         {pos = {x = 0, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Burglar"] =                     {pos = {x = 1, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Blackboard"] =                  {pos = {x = 2, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Runner"] =                      {pos = {x = 3, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Ice Cream"] =                   {pos = {x = 4, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["DNA"] =                         {pos = {x = 5, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Splash"] =                      {pos = {x = 6, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Blue Joker"] =                  {pos = {x = 7, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Sixth Sense"] =                 {pos = {x = 8, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Constellation"] =               {pos = {x = 9, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

SMODS.current_mod.custom.joker_deck.jokers["Hiker"] =                       {pos = {x = 0, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Faceless Joker"] =              {pos = {x = 1, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Green Joker"] =                 {pos = {x = 2, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Superposition"] =               {pos = {x = 3, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["To Do List"] =                  {pos = {x = 4, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Cavendish"] =                   {pos = {x = 5, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Card Sharp"] =                  {pos = {x = 6, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Red Card"] =                    {pos = {x = 7, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Madness"] =                     {pos = {x = 8, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Square Joker"] =                {pos = {x = 9, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

SMODS.current_mod.custom.joker_deck.jokers["Séance"] =                      {pos = {x = 0, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Riff-Raff"] =                   {pos = {x = 1, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Vampire"] =                     {pos = {x = 2, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Shortcut"] =                    {pos = {x = 3, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Hologram"] =                    {pos = {x = 4, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Vagabond"] =                    {pos = {x = 5, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Baron"] =                       {pos = {x = 6, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Cloud 9"] =                     {pos = {x = 7, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Rocket"] =                      {pos = {x = 8, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Obelisk"] =                     {pos = {x = 9, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

SMODS.current_mod.custom.joker_deck.jokers["Midas Mask"] =                  {pos = {x = 0, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Luchador"] =                    {pos = {x = 1, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Photograph"] =                  {pos = {x = 2, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Gift Card"] =                   {pos = {x = 3, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Turtle Bean"] =                 {pos = {x = 4, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Erosion"] =                     {pos = {x = 5, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Reserved Parking"] =            {pos = {x = 6, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Mail-in Rebate"] =              {pos = {x = 7, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["To the Moon"] =                 {pos = {x = 8, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Hallucination"] =               {pos = {x = 9, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

SMODS.current_mod.custom.joker_deck.jokers["Sly Joker"] =                   {pos = {x = 0, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Wily Joker"] =                  {pos = {x = 1, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Clever Joker"] =                {pos = {x = 2, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Devious Joker"] =               {pos = {x = 3, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Crafty Joker"] =                {pos = {x = 4, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Lucky Cat"] =                   {pos = {x = 5, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Baseball Card"] =               {pos = {x = 6, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Bull"] =                        {pos = {x = 7, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Diet Cola"] =                   {pos = {x = 8, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Trading card"] =                {pos = {x = 9, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

SMODS.current_mod.custom.joker_deck.jokers["Flash Card"] =                  {pos = {x = 0, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Popcorn"] =                     {pos = {x = 1, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Ramen"] =                       {pos = {x = 2, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Seltzer"] =                     {pos = {x = 3, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Spare Trousers"] =              {pos = {x = 4, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Campfire"] =                    {pos = {x = 5, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Smiley Face"] =                 {pos = {x = 6, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Ancient Joker"] =               {pos = {x = 7, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Walkie Talkie"] =               {pos = {x = 8, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
SMODS.current_mod.custom.joker_deck.jokers["Castle"] =                      {pos = {x = 9, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

-- SMODS.current_mod.custom.joker_deck.jokers["mISsCALED"] =                   {pos = {x = 2, y = 16}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

for k, v in pairs(SMODS.current_mod.custom.joker_deck.jokers) do
    SMODS.Rank {
        key = v.key or ("rank_" .. SMODS.current_mod.id .. "_" .. k),
        name = v.name or ("Rank " .. k),
        pos = v.pos or {x = 0, y = 0},
        loc_txt = v.loc_txt or k,
        nominal = v.nominal or 0,
        hc_atlas = v.hc_atlas or "asset_atlas",
        lc_atlas = v.lc_atlas or "asset_atlas",
        shorthand = v.shorthand or "Jkr",
        card_key = v.card_key or k,
        disabled = false,
        populate = v.populate or function(self)
            for _, other in pairs(SMODS.Suits) do
                if not other.disabled and other.key == "suit_" .. SMODS.current_mod.id .. "_jokers" then
                    other:update_p_card(self)
                end
            end
            self.disabled = nil
        end,
        inject = function(self)
            self:populate()
        end,
    }
end