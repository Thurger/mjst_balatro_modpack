init_localization()

function SMODS.current_mod.process_loc_text()
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Joker", {
        text = {
            "{C:mult}+#1#{} Mult"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Chaos the Clown", {
        text = {
            "Create a {C:green}D6 tag{}",
            "when {C:spades}scored{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Jolly Joker", {
        text = {
            "{C:mult}+8{} Mult",
            "when {C:spades}scored{} or {C:spades}held in Hand{}",
            "if played hand contains",
            "a {C:attention}Pair{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Zany Joker", {
        text = {
            "{C:mult}+12{} Mult",
            "when {C:spades}scored{} or {C:spades}held in hand{}",
            "if played hand contains",
            "a {C:attention}Three of Kind{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Mad Joker", {
        text = {
            "{C:mult}+10{} Mult",
            "when {C:spades}scored{} or {C:spades}held in hand{}",
            "if played hand contains",
            "{C:attention}Two Pairs{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Crazy Joker", {
        text = {
            "{C:mult}+12{} Mult",
            "when {C:spades}scored{} or {C:spades}held in hand{}",
            "if played hand contains",
            "a {C:attention}Straight{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Droll Joker", {
        text = {
            "{C:mult}+10{} Mult",
            "when {C:spades}scored{} or {C:spades}held in hand{}",
            "if played hand contains",
            "a {C:attention}Flush{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Half Joker", {
        text = {
            "{C:mult}+#2#{} Mult",
            "when {C:spades}scored{} or {C:spades}held in hand{}",
            "if played hand contains",
            "{C:attention}#1# cards{} or less"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Merry Andy", {
        text = {
            "Until end of round",
            "{C:mult}+#1#{} Discards",
            "{C:attention}-#2#{} hand size"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Stone Joker", {
        text = {
            "{C:chips}+#1#{} Chis for",
            "each {C:attention}Stone Card{}",
            "in your {C:attention}full deck{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Juggler", {
        text = {
            "Until end of round",
            "{C:attention}+#1#{} hand size"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Drunkard", {
        text = {
            "Until end of round",
            "{C:mult}+#1#{} discard"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Acrobat", {
        text = {
            "{X:mult,C:white}X#1#{} Mult on {C:attention}final{}",
            "{C:attention}hand{} of round"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Sock and Buskin", {
        text = {
            "Retrigger all scoring",
            "{C:attention}face{} card when",
            "this card is",
            "{C:spades}scored{} or {C:spades}held in hand{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Troubadour", {
        text = {
            "Until end of round",
            "{C:attention}+#1#{} hand size",
            "{C:mult}#2#{} Hand"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Banner", {
        text = {
            "{C:chips}+#1#{} Chips for",
            "each remaining",
            "{C:attention}discard{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Mystic Summit", {
        text = {
            "{C:mult}+#1#{} Mult when",
            "{C:attention}#2#{} discard remaining"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Marble Joker", {
        text = {
            "Adds one {C:attention}Stone{} card",
            "to deck when {C:spades}scored{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Mime", {
        text = {
            "Retrigger all",
            "card {C:attention}held in hand{}",
            "when this card is",
            "{C:spades}scored{} or {C:spades}held in hand{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Credit Card", {
        text = {
            "+#1#$ of debt",
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Greedy Joker", {
        text = {
            "Scoring cards with",
            "{C:diamonds}Diamond{} suit give",
            "{C:mult}+#1#{} Mult",
            "when this card is",
            "{C:spades}scored{} or {C:spades}held in hand{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Lusty Joker", {
        text = {
            "Scoring cards with",
            "{C:hearts}Heart{} suit give",
            "{C:mult}+#1#{} Mult",
            "when this card is",
            "{C:spades}scored{} or {C:spades}held in hand{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Wrathful Joker", {
        text = {
            "Scoring cards with",
            "{C:spades}Spade{} suit give",
            "{C:mult}+#1#{} Mult",
            "when this card is",
            "{C:spades}scored{} or {C:spades}held in hand{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Gluttonous Joker", {
        text = {
            "Scoring cards with",
            "{C:clubs}Club{} suit give",
            "{C:mult}+#1#{} Mult",
            "when this card is",
            "{C:spades}scored{} or {C:spades}held in hand{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Loyalty Card", {
        text = {
            "{C:white,X:mult}X#1#{} Mult every",
            "{C:attention}#2#{} times played",
            "{C:inactive}#3# remaining{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Hack", {
        text = {
            "Retrigger every scoring",
            "{C:attention}2{}, {C:attention}3{}, {C:attention}4{} and {C:attention}5{}",
            "when this card is",
            "{C:spades}scored{} or {C:spades}held in hand{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Steel Joker", {
        text = {
            "{X:mult,C:white}X#1#{} Mult for each",
            "{C:attention}Steel Card{}",
            "in your full deck",
            "{C:inactive}(Currently {X:mult,C:white}#2#{C:inactive} Mult)"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Perkeo", {
        text = {
            "Create a {C:negative}Negative{} copy of",
            "1 random {C:attention}consumable{}",
            "card in your possession",
            "when {C:spades}scored{}"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Yorick", {
        text = {
            "Gains {X:mult,C:white}X1{} when {C:spades}discarded{}",
            "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Triboulet", {
        text = {
            "Played {C:attention}Kings{} and",
            "{C:attention}Queens{} each give",
            "{X:mult,C:white}X#1#{} Mult when scored"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Canio", {
        text = {
            "This Joker gains {X:mult,C:white}X#1#{} Mult",
            "when a {C:attention}face{} card",
            "is destroyed",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
        }
    })
    SMODS.process_loc_text(G.localization.descriptions.Other, "joker_deck_jokers_Chicot", {
        text = {
            "Disables effect of",
            "every {C:attention}Boss Blind"
        }
    })
end