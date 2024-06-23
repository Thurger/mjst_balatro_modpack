G.mjst_config = G.mjst_config or {}
G.mjst_config.joker_deck = G.mjst_config.joker_deck or {}
G.mjst_config.joker_deck.jokers = G.mjst_config.joker_deck.jokers or {}

G.mjst_config.joker_deck.jokers["Joker"] =                       {pos = {x = 0, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "mult"
    },
    loc_text_key = "joker_deck_jokers_Joker",
    joker_ability_vars = {
        mult = 4
    },
    joker_ability = {
        {
            scored = true,
            ret = {
                mult = "mult"
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Chaos the Clown"] =             {pos = {x = 1, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
    },
    loc_text_key = "joker_deck_jokers_Chaos the Clown",
    joker_ability_vars = {
    },
    joker_ability = {
        {
            scored = true,
            create_tag = {"tag_d_six"}
        }
    }
}}
G.mjst_config.joker_deck.jokers["Jolly Joker"] =                 {pos = {x = 2, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
    },
    loc_text_key = "joker_deck_jokers_Jolly Joker",
    joker_ability_vars = {
    },
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
    }
}}
G.mjst_config.joker_deck.jokers["Zany Joker"] =                  {pos = {x = 3, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
    },
    loc_text_key = "joker_deck_jokers_Zany Joker",
    joker_ability_vars = {
    },
    joker_ability = {
        {
            scored = true,
            conditions = {
                contain_hand = "Three of a Kind"
            },
            ret = {
                mult = 12
            }
        },
        {
            held = true,
            conditions = {
                contain_hand = "Three of a Kind"
            },
            ret = {
                h_mult = 12
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Mad Joker"] =                   {pos = {x = 4, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
    },
    loc_text_key = "joker_deck_jokers_Mad Joker",
    joker_ability_vars = {
    },
    joker_ability = {
        {
            scored = true,
            conditions = {
                contain_hand = "Two Pair"
            },
            ret = {
                mult = 10
            }
        },
        {
            held = true,
            conditions = {
                contain_hand = "Two Pair"
            },
            ret = {
                h_mult = 10
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Crazy Joker"] =                 {pos = {x = 5, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
    },
    loc_text_key = "joker_deck_jokers_Crazy Joker",
    joker_ability_vars = {
    },
    joker_ability = {
        {
            scored = true,
            conditions = {
                contain_hand = "Straight"
            },
            ret = {
                mult = 12
            }
        },
        {
            held = true,
            conditions = {
                contain_hand = "Straight"
            },
            ret = {
                h_mult = 12
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Droll Joker"] =                 {pos = {x = 6, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
    },
    loc_text_key = "joker_deck_jokers_Droll Joker",
    joker_ability_vars = {
    },
    joker_ability = {
        {
            scored = true,
            conditions = {
                contain_hand = "Flush"
            },
            ret = {
                mult = 10
            }
        },
        {
            held = true,
            conditions = {
                contain_hand = "Flush"
            },
            ret = {
                h_mult = 10
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Half Joker"] =                  {pos = {x = 7, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "size",
        [2] = "mult"
    },
    loc_text_key = "joker_deck_jokers_Half Joker",
    joker_ability_vars = {
        size = 3,
        mult = 20
    },
    joker_ability = {
        {
            scored = true,
            conditions = {
                hand_size = 1
            },
            ret = {
                mult = 20
            }
        },
        {
            scored = true,
            conditions = {
                hand_size = 2
            },
            ret = {
                mult = 20
            }
        },
        {
            scored = true,
            conditions = {
                hand_size = 3
            },
            ret = {
                mult = 20
            }
        },
        {
            held = true,
            conditions = {
                hand_size = 1
            },
            ret = {
                h_mult = 20
            }
        },
        {
            held = true,
            conditions = {
                hand_size = 2
            },
            ret = {
                h_mult = 20
            }
        },
        {
            held = true,
            conditions = {
                hand_size = 3
            },
            ret = {
                h_mult = 20
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Merry Andy"] =                  {pos = {x = 8, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "discards",
        [2] = "hand_size"
    },
    loc_text_key = "joker_deck_jokers_Merry Andy",
    joker_ability_vars = {
        discards = 3,
        hand_size = 1
    },
    joker_ability = {
        {
            scored = true,
            add_discard = 3,
            add_hand_size = -1
        }
    }
}}
G.mjst_config.joker_deck.jokers["Stone Joker"] =                 {pos = {x = 9, y = 0}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "stone_joker"
    },
    loc_text_key = "joker_deck_jokers_Stone Joker",
    joker_ability_vars = {
        stone_joker = 25
    },
    joker_ability = {
        {
            scored = true,
            stone_joker = 25
        }
    }
}}
G.mjst_config.joker_deck.jokers["Juggler"] =                     {pos = {x = 0, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "hand_size"
    },
    loc_text_key = "joker_deck_jokers_Juggler",
    joker_ability_vars = {
        hand_size = 1
    },
    joker_ability = {
        {
            scored = true,
            add_hand_size = 1
        }
    }
}}
G.mjst_config.joker_deck.jokers["Drunkard"] =                    {pos = {x = 1, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "discards"
    },
    loc_text_key = "joker_deck_jokers_Drunkard",
    joker_ability_vars = {
        discards = 1
    },
    joker_ability = {
        {
            scored = true,
            add_discard = 1,
        }
    }
}}
G.mjst_config.joker_deck.jokers["Acrobat"] =                     {pos = {x = 2, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "x_mult"
    },
    loc_text_key = "joker_deck_jokers_Acrobat",
    joker_ability_vars = {
        x_mult = 3
    },
    joker_ability = {
        {
            scored = true,
            conditions = {
                remaining_hand = 0
            },
            ret = {
                x_mult = 3
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Sock and Buskin"] =             {pos = {x = 3, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
    },
    loc_text_key = "joker_deck_jokers_Sock and Buskin",
    joker_ability_vars = {
    },
    joker_ability = {--TODO
        {
            scored = true,
            retrigger_scoring_face_card = 1,
        }
    }
}}
G.mjst_config.joker_deck.jokers["Mime"] =                        {pos = {x = 4, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Credit Card"] =                 {pos = {x = 5, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Greedy Joker"] =                {pos = {x = 6, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "mult"
    },
    loc_text_key = "joker_deck_jokers_Greedy Joker",
    joker_ability_vars = {
        mult = 3
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                card_is_suit = "Diamonds"
            },
            ret = {
                mult = 3
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Lusty Joker"] =                 {pos = {x = 7, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "mult"
    },
    loc_text_key = "joker_deck_jokers_Lusty Joker",
    joker_ability_vars = {
        mult = 3
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                card_is_suit = "Hearts"
            },
            ret = {
                mult = 3
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Wrathful Joker"] =              {pos = {x = 8, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "mult"
    },
    loc_text_key = "joker_deck_jokers_Wrathful Joker",
    joker_ability_vars = {
        mult = 3
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                card_is_suit = "Spades"
            },
            ret = {
                mult = 3
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Gluttonous Joker"] =            {pos = {x = 9, y = 1}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "mult"
    },
    loc_text_key = "joker_deck_jokers_Gluttonous Joker",
    joker_ability_vars = {
        mult = 3
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                card_is_suit = "Clubs"
            },
            ret = {
                mult = 3
            }
        }
    }
}}

G.mjst_config.joker_deck.jokers["Troubadour"] =                  {pos = {x = 0, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "hand_size",
        [2] = "hands"
    },
    loc_text_key = "joker_deck_jokers_Troubadour",
    joker_ability_vars = {
        hand_size = 2,
        hands = -1
    },
    joker_ability = {
        {
            scored = true,
            add_hand_size = 2,
            add_hand = -1
        }
    }
}}
G.mjst_config.joker_deck.jokers["Banner"] =                      {pos = {x = 1, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "chips",
    },
    loc_text_key = "joker_deck_jokers_Banner",
    joker_ability_vars = {
        chips = 30,
    },
    joker_ability = {
        {
            scored = true,
            banner = 30,
        }
    }
}}
G.mjst_config.joker_deck.jokers["Mystic Summit"] =               {pos = {x = 2, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "mult",
        [2] = "remaining_discard"
    },
    loc_text_key = "joker_deck_jokers_Mystic Summit",
    joker_ability_vars = {
        mult = 15,
        remaining_discard = 0
    },
    joker_ability = {
        {
            scored = true,
            conditions = {
                remaining_discard = 0
            },
            ret = {
                mult = 15
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Marble Joker"] =                {pos = {x = 3, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
    },
    loc_text_key = "joker_deck_jokers_Marble Joker",
    joker_ability = {
        {
            scored = true,
            create_p_card = {
                {
                    value = "random",
                    enhancement = "m_stone"
                }
            },
        }
    }
}}
G.mjst_config.joker_deck.jokers["Loyalty Card"] =                {pos = {x = 4, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Hack"] =                        {pos = {x = 5, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Misprint"] =                    {pos = {x = 6, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Steel Joker"] =                 {pos = {x = 7, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            steel_joker = 0.2,
        }
    }
}}
G.mjst_config.joker_deck.jokers["Raised Fist"] =                 {pos = {x = 8, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Golden Joker"] =                {pos = {x = 9, y = 2}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            ret = {
                dollars = 4
            }
        }
    }
}}

G.mjst_config.joker_deck.jokers["Blueprint"] =                   {pos = {x = 0, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Glass Joker"] =                 {pos = {x = 1, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    glass_shattered = 0,-- TODO
    joker_ability = {
        {
            scored = true,
            glass_joker = 0.75
        },
        {
            held = true,
            glass_joker = 0.75
        },
        {
            played = true,
            glass_joker = 0.75
        }
    }
}}
G.mjst_config.joker_deck.jokers["Scary Face"] =                  {pos = {x = 2, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability_vars = {
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                is_face = true
            },
            ret = {
                chips = 30,
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Abstract Joker"] =              {pos = {x = 3, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {-- TODO MODIFY FOR EVERY JOKER ON SCREEN
        {
            scored = true,
            abstract_joker = 3,
        }
    }
}}
G.mjst_config.joker_deck.jokers["Delayed Gratification"] =       {pos = {x = 4, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Golden Ticket"] =               {pos = {x = 5, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Pareidolia"] =                  {pos = {x = 6, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Cartomancer"] =                 {pos = {x = 7, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            create_tarot_card = {
                {
                    value = "random"
                }
            },
        }
    }
}}
G.mjst_config.joker_deck.jokers["Even Steven"] =                 {pos = {x = 8, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability_vars = {
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                is_value = {2, 4, 6, 8, 10}
            },
            ret = {
                mult = 4,
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Odd Todd"] =                    {pos = {x = 9, y = 3}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability_vars = {
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                is_value = {3, 5, 7, 9, 14}
            },
            ret = {
                chips = 31,
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Scholar"] =                     {pos = {x = 0, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability_vars = {
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                is_value = {14}
            },
            ret = {
                mult = 4,
                chips = 20
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Business Card"] =               {pos = {x = 1, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability_vars = {
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                is_face = true,
                probability = 2
            },
            ret = {
                dollars = 2
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Supernova"] =                   {pos = {x = 2, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Mr. Bones"] =                   {pos = {x = 3, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Seing Double"] =                {pos = {x = 4, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["The Duo"] =                     {pos = {x = 5, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            conditions = {
                contain_hand = "Pair"
            },
            ret = {
                x_mult = 2
            }
        },
        {
            held = true,
            conditions = {
                contain_hand = "Pair"
            },
            ret = {
                h_x_mult = 2
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["The Trio"] =                    {pos = {x = 6, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            conditions = {
                contain_hand = "Three of a Kind"
            },
            ret = {
                x_mult = 3
            }
        },
        {
            held = true,
            conditions = {
                contain_hand = "Three of a Kind"
            },
            ret = {
                h_x_mult = 3
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["The Family"] =                  {pos = {x = 7, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            conditions = {
                contain_hand = "Four of a Kind"
            },
            ret = {
                x_mult = 4
            }
        },
        {
            held = true,
            conditions = {
                contain_hand = "Four of a Kind"
            },
            ret = {
                h_x_mult = 4
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["The Order"] =                   {pos = {x = 8, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            conditions = {
                contain_hand = "Straight"
            },
            ret = {
                x_mult = 3
            }
        },
        {
            held = true,
            conditions = {
                contain_hand = "Straight"
            },
            ret = {
                h_x_mult = 3
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["The Tribe"] =                   {pos = {x = 9, y = 4}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            conditions = {
                contain_hand = "Flush"
            },
            ret = {
                x_mult = 2
            }
        },
        {
            held = true,
            conditions = {
                contain_hand = "Flush"
            },
            ret = {
                h_x_mult = 2
            }
        }
    }
}}

G.mjst_config.joker_deck.jokers["8 Ball"] =                      {pos = {x = 0, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    -- TODO not working
    loc_vars = {
    },
    loc_text_key = "joker_deck_jokers_8 Ball",
    joker_ability_vars = {
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                is_value = {8},
                probability = 4
            },
            create_tarot_card = {
                {
                    value = "random"
                }
            },
        }
    }
}}
-- On held: Classic Effect
-- On Played: Every other 8 with 1 on 1 probability
G.mjst_config.joker_deck.jokers["Fibonacci"] =                   {pos = {x = 1, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "mult",
    },
    loc_text_key = "joker_deck_jokers_Fibonacci",
    joker_ability_vars = {
        mult = 8,
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                is_value = {1, 2, 3, 5, 8, 14}
            },
            ret = {
                mult = 8
            }
        }
    }
}}
-- X Mult by missing card in hand not counting Stencil (pair = X4) 
G.mjst_config.joker_deck.jokers["Joker Stencil"] =               {pos = {x = 2, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Space Joker"] =                 {pos = {x = 3, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            before = true,
            ret = {
                level_up = 1
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Matador"] =                     {pos = {x = 4, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
-- Value instead of price (8 of spade == 8)
G.mjst_config.joker_deck.jokers["Ceremonial Dagger"] =           {pos = {x = 5, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
-- Next shop will have a joker you owned
G.mjst_config.joker_deck.jokers["Showman"] =                     {pos = {x = 6, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Fortune Teller"] =              {pos = {x = 7, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            fortune_teller = 1
        }
    }
}}
G.mjst_config.joker_deck.jokers["Hit the Road"] =                {pos = {x = 8, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Swashbuckler"] =                {pos = {x = 9, y = 5}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}

G.mjst_config.joker_deck.jokers["Flower Pot"] =                  {pos = {x = 0, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Ride the Bus"] =                {pos = {x = 1, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Shoot the Moon"] =              {pos = {x = 2, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}

-- Smeared Joker effect until end of turn
G.mjst_config.joker_deck.jokers["Smeared Joker"] =               {pos = {x = 4, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
-- Add 1 to normal probability until end of turn
G.mjst_config.joker_deck.jokers["Oops! All 6s"] =                {pos = {x = 5, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
-- Four Fingers effect until end of turn
G.mjst_config.joker_deck.jokers["Four Fingers"] =                {pos = {x = 6, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Gros Michel"] =                 {pos = {x = 7, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    key = "Gros Michel",
    loc_vars = {
        [1] = "mult",
    },
    loc_text_key = "joker_deck_jokers_Gros Michel",
    joker_ability_vars = {
        mult = 15
    },
    joker_ability = {
        [1] = {
            scored = true,
            ret = {
                mult = 15,
            }
        },
        [2] = {
            destroy = true,
            conditions = {
                probability = 6
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Stuntman"] =                    {pos = {x = 8, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            add_hand_size = -2,
            ret = {
                chips = 250,
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Hanging Chad"] =                {pos = {x = 9, y = 6}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}

G.mjst_config.joker_deck.jokers["Driver's License"] =            {pos = {x = 0, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {--TODO TEST THE CARD
        {
            scored = true,
            conditions = {
                enhanced_card = 16
            },
            ret = {
                x_mult = 3
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Invisible Joker"] =             {pos = {x = 1, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Astronomer"] =                  {pos = {x = 2, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Burnt Joker"] =                 {pos = {x = 3, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Dusk"] =                        {pos = {x = 4, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Throwback"] =                   {pos = {x = 5, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            throwback = 0.25
        }
    }
}}
G.mjst_config.joker_deck.jokers["The Idol"] =                    {pos = {x = 6, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Brainstorm"] =                  {pos = {x = 7, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Satellite"] =                   {pos = {x = 8, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            satellite = 1
        }
    }
}}
G.mjst_config.joker_deck.jokers["Rough Gem"] =                   {pos = {x = 9, y = 7}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "dollars"
    },
    loc_text_key = "joker_deck_jokers_Rough Gem",
    joker_ability_vars = {
        dollars = 1
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                card_is_suit = "Diamonds"
            },
            ret = {
                dollars = 1
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Bloodstone"] =                 {pos = {x = 0, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "x_mult"
    },
    loc_text_key = "joker_deck_jokers_Bloodstone",
    joker_ability_vars = {
        x_mult = 1.5
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                card_is_suit = "Hearts",
                probability = 2
            },
            ret = {
                x_mult = 0.5
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Arrowhead"] =                   {pos = {x = 1, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "chips"
    },
    loc_text_key = "joker_deck_jokers_Arrowhead",
    joker_ability_vars = {
        chips = 30
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                card_is_suit = "Spades"
            },
            ret = {
                chips = 30
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Onyx Agate"] =                  {pos = {x = 2, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "mult"
    },
    loc_text_key = "joker_deck_jokers_Onyx Agate",
    joker_ability_vars = {
        mult = 7
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                card_is_suit = "Clubs"
            },
            ret = {
                mult = 7
            }
        }
    }
}}
-- G.mjst_config.joker_deck.jokers["Player"] =                      {pos = {x = 3, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
-- G.mjst_config.joker_deck.jokers["Proud Joker"] =                 {pos = {x = 4, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
-- G.mjst_config.joker_deck.jokers["Patch"] =                       {pos = {x = 5, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
-- G.mjst_config.joker_deck.jokers["Umbrella"] =                    {pos = {x = 6, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
-- G.mjst_config.joker_deck.jokers["AI"] =                          {pos = {x = 7, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Certificate"] =                 {pos = {x = 8, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Bootstraps"] =                  {pos = {x = 9, y = 8}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            bootstraps = {mult = 2, dollars = 5}
        }
    }
}}

-- G.mjst_config.joker_deck.jokers["The Cow"] =                     {pos = {x = 0, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
-- G.mjst_config.joker_deck.jokers["Autumn"] =                      {pos = {x = 1, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
-- G.mjst_config.joker_deck.jokers["Prime"] =                       {pos = {x = 2, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Caino"] =                       {pos = {x = 3, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 3, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Triboulet"] =                   {pos = {x = 4, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 3, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Yorick"] =                      {pos = {x = 5, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 3, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
        [1] = "x_mult"
    },
    loc_text_key = "joker_deck_jokers_Yorick",
    joker_ability_vars = {
        x_mult = 1
    },
    joker_ability = {
        {
            scored = true,
            ret = {
                x_mult = "x_mult"
            }
        },
        {
            discarded = true,
            ease_var = {
                x_mult = 1
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Chicot"] =                      {pos = {x = 6, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 3, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Perkeo"] =                      {pos = {x = 7, y = 9}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 3, all_ranks = true, all_suits = true, no_debuff = true,
    loc_vars = {
    },
    loc_text_key = "joker_deck_jokers_Perkeo",
    joker_ability_vars = {
    },
    joker_ability = {
        {
            scored = true,
            perkeo = 1
        }
    }
}}

G.mjst_config.joker_deck.jokers["Egg"] =                         {pos = {x = 0, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability_vars = {
        sell_value = 2
    },
    joker_ability = {
        [1] = {
            scored = true,
            ret = {
                dollars = "sell_value",
            }
        },
        [2] = {
            scored = true,
            ease_var = {
                sell_value = 3
            },
        }
    }
}}
G.mjst_config.joker_deck.jokers["Burglar"] =                     {pos = {x = 1, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            add_hand = 3,
            remove_all_discard = true
        }
    }
}}
G.mjst_config.joker_deck.jokers["Blackboard"] =                  {pos = {x = 2, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Runner"] =                      {pos = {x = 3, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    -- TODO Test
    key = "Runner",
    loc_vars = {
        [1] = "chips",
    },
    loc_text_key = "joker_deck_jokers_Runner",
    joker_ability_vars = {
        chips = 15,
        v_chips = 0
    },
    joker_ability = {
        [1] = {
            scored = true,
            conditions = {
                contain_hand = "Straight"
            },
            ease_var = {
                v_chips = 15
            }
        },
        [2] = {
            held = true,
            conditions = {
                contain_hand = "Straight"
            },
            ease_var = {
                v_chips = 15
            }
        },
        [3] = {
            scored = true,
            ret = {
                chips = "v_chips"
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Ice Cream"] =                   {pos = {x = 4, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability_vars = {
        chips = 100,
        destroy = 0
    },
    joker_ability = {
        [1] = {
            scored = true,
            ret = {
                chips = "chips"
            },
        },
        [2] = {
            scored = true,
            ease_var = {
                chips = -5
            }
        },
        [3] = {
            held = true,
            ret = {
                h_chips = "chips"
            },
        },
        [4] = {
            held = true,
            ease_var = {
                chips = -5
            }
        },
        [5] = {
            destroy = true,
            conditions = {
                var_compare = {
                    method = ">",
                    v1 = "destroy",
                    v2 = "chips"
                }
            },
        }
    }
}}
G.mjst_config.joker_deck.jokers["DNA"] =                         {pos = {x = 5, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            conditions = {
                contain_hand = "Pair",
                hand_size = 2
            },
            scored = true,
            dna = true
        }
    }
}}
G.mjst_config.joker_deck.jokers["Splash"] =                      {pos = {x = 6, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Blue Joker"] =                  {pos = {x = 7, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            blue_joker = 2
        }
    }
}}
G.mjst_config.joker_deck.jokers["Sixth Sense"] =                 {pos = {x = 8, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Constellation"] =               {pos = {x = 9, y = 10}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}

G.mjst_config.joker_deck.jokers["Hiker"] =                       {pos = {x = 0, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Faceless Joker"] =              {pos = {x = 1, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Green Joker"] =                 {pos = {x = 2, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Superposition"] =               {pos = {x = 3, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["To Do List"] =                  {pos = {x = 4, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Cavendish"] =                   {pos = {x = 5, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        [1] = {
            scored = true,
            ret = {
                x_mult = 3,
            }
        },
        [2] = {
            destroy = true,
            conditions = {
                probability = 1000
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Card Sharp"] =                  {pos = {x = 6, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Red Card"] =                    {pos = {x = 7, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Madness"] =                     {pos = {x = 8, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Square Joker"] =                {pos = {x = 9, y = 11}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}

G.mjst_config.joker_deck.jokers["Seance"] =                      {pos = {x = 0, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Riff-raff"] =                   {pos = {x = 1, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            riff_raff = {
                amount = 2,
                rarity = 0
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Vampire"] =                     {pos = {x = 2, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Shortcut"] =                    {pos = {x = 3, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Hologram"] =                    {pos = {x = 4, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Vagabond"] =                    {pos = {x = 5, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Baron"] =                       {pos = {x = 6, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Cloud 9"] =                     {pos = {x = 7, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            cloud_9 = {id = 9, dollars = 1}
        }
    }
}}
G.mjst_config.joker_deck.jokers["Rocket"] =                      {pos = {x = 8, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Obelisk"] =                     {pos = {x = 9, y = 12}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true}}

G.mjst_config.joker_deck.jokers["Midas Mask"] =                  {pos = {x = 0, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability_vars = {
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                is_face = true
            },
            enhance_card = "m_gold"
        }
    }
}}
G.mjst_config.joker_deck.jokers["Luchador"] =                    {pos = {x = 1, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Photograph"] =                  {pos = {x = 2, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Gift Card"] =                   {pos = {x = 3, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Turtle Bean"] =                 {pos = {x = 4, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability_vars = {
        hand_size = 5,
        destroy = 0
    },
    joker_ability = {
        [1] = {
            scored = true,
            add_hand_size = "hand_size",
        },
        [2] = {
            scored = true,
            ease_var = {
                hand_size = -1
            }
        },
        [3] = {
            destroy = true,
            conditions = {
                var_compare = {
                    method = "==",
                    v1 = "hand_size",
                    v2 = "destroy"
                }
            },
        }
    }
}}
G.mjst_config.joker_deck.jokers["Erosion"] =                     {pos = {x = 5, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Reserved Parking"] =            {pos = {x = 6, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Mail-in Rebate"] =              {pos = {x = 7, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["To the Moon"] =                 {pos = {x = 8, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Hallucination"] =               {pos = {x = 9, y = 13}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true}}

G.mjst_config.joker_deck.jokers["Sly Joker"] =                   {pos = {x = 0, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            conditions = {
                contain_hand = "Pair"
            },
            ret = {
                chips = 50
            }
        },
        {
            held = true,
            conditions = {
                contain_hand = "Pair"
            },
            ret = {
                h_chips = 50
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Wily Joker"] =                  {pos = {x = 1, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            conditions = {
                contain_hand = "Three of a Kind"
            },
            ret = {
                chips = 100
            }
        },
        {
            held = true,
            conditions = {
                contain_hand = "Three of a Kind"
            },
            ret = {
                h_chips = 100
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Clever Joker"] =                {pos = {x = 2, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            conditions = {
                contain_hand = "Two Pair"
            },
            ret = {
                chips = 80
            }
        },
        {
            held = true,
            conditions = {
                contain_hand = "Two Pair"
            },
            ret = {
                h_chips = 80
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Devious Joker"] =               {pos = {x = 3, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            conditions = {
                contain_hand = "Straight"
            },
            ret = {
                chips = 100
            }
        },
        {
            held = true,
            conditions = {
                contain_hand = "Straight"
            },
            ret = {
                h_chips = 100
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Crafty Joker"] =                {pos = {x = 4, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            conditions = {
                contain_hand = "Flush"
            },
            ret = {
                chips = 80
            }
        },
        {
            held = true,
            conditions = {
                contain_hand = "Flush"
            },
            ret = {
                h_chips = 80
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Lucky Cat"] =                   {pos = {x = 5, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Baseball Card"] =               {pos = {x = 6, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Bull"] =                        {pos = {x = 7, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability = {
        {
            scored = true,
            bull = {chips = 2, dollars = 1}
        }
    }
}}

G.mjst_config.joker_deck.jokers["Diet Cola"] =                   {pos = {x = 8, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Trading card"] =                {pos = {x = 9, y = 14}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}

G.mjst_config.joker_deck.jokers["Flash Card"] =                  {pos = {x = 0, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Popcorn"] =                     {pos = {x = 1, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability_vars = {
        mult = 20,
        destroy = 0
    },
    joker_ability = {
        [1] = {
            scored = true,
            ret = {
                mult = "mult"
            },
        },
        [2] = {
            scored = true,
            ease_var = {
                mult = -4
            }
        },
        [3] = {
            destroy = true,
            conditions = {
                var_compare = {
                    method = "==",
                    v1 = "mult",
                    v2 = "destroy"
                }
            },
        }
    }
}}
G.mjst_config.joker_deck.jokers["Ramen"] =                       {pos = {x = 2, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Seltzer"] =                     {pos = {x = 3, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Spare Trousers"] =              {pos = {x = 4, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability_vars = {
        mult = 0
    },
    joker_ability = {
        [1] = {
            scored = true,
            conditions = {
                contain_hand = "Two Pair"
            },
            ease_var = {
                mult = 2
            }
        },
        [2] = {
            scored = true,
            ret = {
                mult = "mult"
            }
        },
        [3] = {
            held = true,
            conditions = {
                contain_hand = "Two Pair"
            },
            ease_var = {
                mult = 2
            }
        }
    }
}}

G.mjst_config.joker_deck.jokers["Campfire"] =                    {pos = {x = 5, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Smiley Face"] =                 {pos = {x = 6, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability_vars = {
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                is_face = true
            },
            ret = {
                mult = 5,
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Ancient Joker"] =               {pos = {x = 7, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 2, all_ranks = true, all_suits = true, no_debuff = true}}
G.mjst_config.joker_deck.jokers["Walkie Talkie"] =               {pos = {x = 8, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 0, all_ranks = true, all_suits = true, no_debuff = true,
    joker_ability_vars = {
    },
    joker_ability = {
        {
            other = true,
            conditions = {
                is_value = {10, 4}
            },
            ret = {
                mult = 4,
                chips = 10
            }
        }
    }
}}
G.mjst_config.joker_deck.jokers["Castle"] =                      {pos = {x = 9, y = 15}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {rarity = 1, all_ranks = true, all_suits = true, no_debuff = true}}

-- G.mjst_config.joker_deck.jokers["mISsCALED"] =                   {pos = {x = 2, y = 16}, lc_atlas = SMODS.current_mod.id .. "joker_suit", hc_atlas = SMODS.current_mod.id .. "joker_suit", ability = {all_ranks = true, all_suits = true, no_debuff = true}}

for k, v in pairs(G.mjst_config.joker_deck.jokers) do
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