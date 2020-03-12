# Trello webhooks corresponding fields

trello_board_id = payload['model']['id']

## Card creation
### Create a user story ###
```ruby
@user_story = {
  "model"=>{
    "id"=>"5e6aa5fc2d9c2815ece6c12a",
    "name"=>"Test",
    "desc"=>"",
    "descData"=>nil,
    "closed"=>false,
    "idOrganization"=>nil,
    "idEnterprise"=>nil,
    "pinned"=>false,
    "url"=>"https://trello.com/b/sWfheMYx/test",
    "shortUrl"=>"https://trello.com/b/sWfheMYx",
    "prefs"=>{
      "permissionLevel"=>"private",
      "hideVotes"=>false,
      "voting"=>"disabled",
      "comments"=>"members",
      "invitations"=>"members",
      "selfJoin"=>true,
      "cardCovers"=>true,
      "isTemplate"=>false,
      "cardAging"=>"regular",
      "calendarFeedEnabled"=>false,
      "background"=>"blue",
      "backgroundImage"=>nil,
      "backgroundImageScaled"=>nil,
      "backgroundTile"=>false,
      "backgroundBrightness"=>"dark",
      "backgroundColor"=>"#0079BF",
      "backgroundBottomColor"=>"#0079BF",
      "backgroundTopColor"=>"#0079BF",
      "canBePublic"=>true,
      "canBeEnterprise"=>true,
      "canBeOrg"=>true,
      "canBePrivate"=>true,
      "canInvite"=>true
    },
    "labelNames"=>{
      "green"=>"",
      "yellow"=>"",
      "orange"=>"",
      "red"=>"",
      "purple"=>"",
      "blue"=>"",
      "sky"=>"",
      "lime"=>"",
      "pink"=>"",
      "black"=>""
    }
  },
  "action"=>{
    "id"=>"5e6aa67afc05990671220f21",
    "idMemberCreator"=>"5e15f0988d06c5602566b8a4",
    "data"=>{
      "card"=>{
        "id"=>"5e6aa67afc05990671220f20",
        "name"=>"This is a user story",
        "idShort"=>1,
        "shortLink"=>"4NUGggEs"
      },
      "list"=>{
        "id"=>"5e6aa601a41ebc5215be363a",
        "name"=>"Sprint 1"
      },
      "board"=>{
        "id"=>"5e6aa5fc2d9c2815ece6c12a",
        "name"=>"Test",
        "shortLink"=>"sWfheMYx"
      }
    },
    "type"=>"createCard",
    "date"=>"2020-03-12T21:15:38.075Z",
    "limits"=>{},
    "display"=>{
      "translationKey"=>"action_create_card",
      "entities"=>{
        "card"=>{
          "type"=>"card",
          "id"=>"5e6aa67afc05990671220f20",
          "shortLink"=>"4NUGggEs",
          "text"=>"This is a user story"
        },
        "list"=>{
          "type"=>"list",
          "id"=>"5e6aa601a41ebc5215be363a",
          "text"=>"Sprint 1"
        },
        "memberCreator"=>{
          "type"=>"member",
          "id"=>"5e15f0988d06c5602566b8a4",
          "username"=>"youennpriser1",
          "text"=>"Youenn PRISER"
        }
      }
    },
    "memberCreator"=>{
      "id"=>"5e15f0988d06c5602566b8a4",
      "activityBlocked"=>false,
      "avatarHash"=>"19134595ae40f2c5271054102acba78f",
      "avatarUrl"=>"https://trello-members.s3.amazonaws.com/5e15f0988d06c5602566b8a4/19134595ae40f2c5271054102acba78f",
      "fullName"=>"youenn.priser",
      "idMemberReferrer"=>nil,
      "initials"=>"Y",
      "nonPublic"=>{},
      "nonPublicAvailable"=>true,
      "username"=>"youennpriser1"
    }
  }
}
```

### Create a task ###
```ruby
@task = {
  "model"=>{
    "id"=>"5e6aa5fc2d9c2815ece6c12a",
    "name"=>"Test",
    "desc"=>"",
    "descData"=>nil,
    "closed"=>false,
    "idOrganization"=>nil,
    "idEnterprise"=>nil,
    "pinned"=>false,
    "url"=>"https://trello.com/b/sWfheMYx/test",
    "shortUrl"=>"https://trello.com/b/sWfheMYx",
    "prefs"=>{
      "permissionLevel"=>"private",
      "hideVotes"=>false,
      "voting"=>"disabled",
      "comments"=>"members",
      "invitations"=>"members",
      "selfJoin"=>true,
      "cardCovers"=>true,
      "isTemplate"=>false,
      "cardAging"=>"regular",
      "calendarFeedEnabled"=>false,
      "background"=>"blue",
      "backgroundImage"=>nil,
      "backgroundImageScaled"=>nil,
      "backgroundTile"=>false,
      "backgroundBrightness"=>"dark",
      "backgroundColor"=>"#0079BF",
      "backgroundBottomColor"=>"#0079BF",
      "backgroundTopColor"=>"#0079BF",
      "canBePublic"=>true,
      "canBeEnterprise"=>true,
      "canBeOrg"=>true,
      "canBePrivate"=>true,
      "canInvite"=>true
    },
    "labelNames"=>{
      "green"=>"",
      "yellow"=>"",
      "orange"=>"",
      "red"=>"",
      "purple"=>"",
      "blue"=>"",
      "sky"=>"",
      "lime"=>"",
      "pink"=>"",
      "black"=>""
    }
  },
  "action"=>{
    "id"=>"5e6aa6e4d1dc2b1cf4f1d854",
    "idMemberCreator"=>"5e15f0988d06c5602566b8a4",
    "data"=>{
      "card"=>{
        "id"=>"5e6aa6e4d1dc2b1cf4f1d853",
        "name"=>"This is a task",
        "idShort"=>2,
        "shortLink"=>"hfcQc8h0"
      },
      "list"=>{
        "id"=>"5e6aa600d92be37f573dd4e3",
        "name"=>"To Do"
      },
      "board"=>{
        "id"=>"5e6aa5fc2d9c2815ece6c12a",
        "name"=>"Test",
        "shortLink"=>"sWfheMYx"
      }
    },
    "type"=>"createCard",
    "date"=>"2020-03-12T21:17:24.694Z",
    "limits"=>{},
    "display"=>{
      "translationKey"=>"action_create_card",
      "entities"=>{
        "card"=>{
          "type"=>"card",
          "id"=>"5e6aa6e4d1dc2b1cf4f1d853",
          "shortLink"=>"hfcQc8h0",
          "text"=>"This is a task"
        },
        "list"=>{
          "type"=>"list",
          "id"=>"5e6aa600d92be37f573dd4e3",
          "text"=>"To Do"
        },
        "memberCreator"=>{
          "type"=>"member",
          "id"=>"5e15f0988d06c5602566b8a4",
          "username"=>"youennpriser1",
          "text"=>"Youenn PRISER"
        }
      }
    },
    "memberCreator"=>{
      "id"=>"5e15f0988d06c5602566b8a4",
      "activityBlocked"=>false,
      "avatarHash"=>"19134595ae40f2c5271054102acba78f",
      "avatarUrl"=>"https://trello-members.s3.amazonaws.com/5e15f0988d06c5602566b8a4/19134595ae40f2c5271054102acba78f",
      "fullName"=>"youenn.priser",
      "idMemberReferrer"=>nil,
      "initials"=>"Y",
      "nonPublic"=>{},
      "nonPublicAvailable"=>true,
      "username"=>"youennpriser1"
    }
  }
}
```
### Attaching @task to @user_story from @task (from @user_story impossible at test time) ###
```ruby
@task_attached_to_user_story = {
  "model"=>{
    "id"=>"5e6aa5fc2d9c2815ece6c12a",
    "name"=>"Test",
    "desc"=>"",
    "descData"=>nil,
    "closed"=>false,
    "idOrganization"=>nil,
    "idEnterprise"=>nil,
    "pinned"=>false,
    "url"=>"https://trello.com/b/sWfheMYx/test",
    "shortUrl"=>"https://trello.com/b/sWfheMYx",
    "prefs"=>{
      "permissionLevel"=>"private",
      "hideVotes"=>false,
      "voting"=>"disabled",
      "comments"=>"members",
      "invitations"=>"members",
      "selfJoin"=>true,
      "cardCovers"=>true,
      "isTemplate"=>false,
      "cardAging"=>"regular",
      "calendarFeedEnabled"=>false,
      "background"=>"blue",
      "backgroundImage"=>nil,
      "backgroundImageScaled"=>nil,
      "backgroundTile"=>false,
      "backgroundBrightness"=>"dark",
      "backgroundColor"=>"#0079BF",
      "backgroundBottomColor"=>"#0079BF",
      "backgroundTopColor"=>"#0079BF",
      "canBePublic"=>true,
      "canBeEnterprise"=>true,
      "canBeOrg"=>true,
      "canBePrivate"=>true,
      "canInvite"=>true
    },
    "labelNames"=>{
      "green"=>"",
      "yellow"=>"",
      "orange"=>"",
      "red"=>"",
      "purple"=>"",
      "blue"=>"",
      "sky"=>"",
      "lime"=>"",
      "pink"=>"",
      "black"=>""
    }
  },
  "action"=>{
    "id"=>"5e6aa7f5edef6a662a04f28c",
    "idMemberCreator"=>"5e15f0988d06c5602566b8a4",
    "data"=>{
      "attachment"=>{
        "id"=>"5e6aa7f5edef6a662a04f28b",
        "name"=>"https://trello.com/c/4NUGggEs/1-this-is-a-user-story",
        "url"=>"https://trello.com/c/4NUGggEs/1-this-is-a-user-story"
      },
      "card"=>{
        "id"=>"5e6aa6e4d1dc2b1cf4f1d853",
        "name"=>"This is a task",
        "idShort"=>2,
        "shortLink"=>"hfcQc8h0"
      },
      "list"=>{
        "id"=>"5e6aa600d92be37f573dd4e3",
        "name"=>"To Do"
      },
      "board"=>{
        "id"=>"5e6aa5fc2d9c2815ece6c12a",
        "name"=>"Test",
        "shortLink"=>"sWfheMYx"
      }
    },
    "type"=>"addAttachmentToCard",
    "date"=>"2020-03-12T21:21:57.200Z",
    "limits"=>{},
    "display"=>{
      "translationKey"=>"action_add_attachment_to_card",
      "entities"=>{
        "attachment"=>{
          "type"=>"attachment",
          "id"=>"5e6aa7f5edef6a662a04f28b",
          "link"=>true,
          "text"=>"https://trello.com/c/4NUGggEs/1-this-is-a-user-story",
          "url"=>"https://trello.com/c/4NUGggEs/1-this-is-a-user-story"
        },
        "attachmentPreview"=>{
          "type"=>"attachmentPreview",
          "id"=>"5e6aa7f5edef6a662a04f28b",
          "originalUrl"=>"https://trello.com/c/4NUGggEs/1-this-is-a-user-story"
        },
        "card"=>{
          "type"=>"card",
          "id"=>"5e6aa6e4d1dc2b1cf4f1d853",
          "shortLink"=>"hfcQc8h0",
          "text"=>"This is a task"
        },
        "memberCreator"=>{
          "type"=>"member",
          "id"=>"5e15f0988d06c5602566b8a4",
          "username"=>"youennpriser1",
          "text"=>"Youenn PRISER"
        }
      }
    },
    "memberCreator"=>{
      "id"=>"5e15f0988d06c5602566b8a4",
      "activityBlocked"=>false,
      "avatarHash"=>"19134595ae40f2c5271054102acba78f",
      "avatarUrl"=>"https://trello-members.s3.amazonaws.com/5e15f0988d06c5602566b8a4/19134595ae40f2c5271054102acba78f",
      "fullName"=>"youenn.priser",
      "idMemberReferrer"=>nil,
      "initials"=>"Y",
      "nonPublic"=>{},
      "nonPublicAvailable"=>true,
      "username"=>"youennpriser1"
    }
  }
}
```
### Adding a label to @task ###
```ruby
@task_added_label = {
  "model"=>{
    "id"=>"5e6aa5fc2d9c2815ece6c12a",
    "name"=>"Test",
    "desc"=>"",
    "descData"=>nil,
    "closed"=>false,
    "idOrganization"=>nil,
    "idEnterprise"=>nil,
    "pinned"=>false,
    "url"=>"https://trello.com/b/sWfheMYx/test",
    "shortUrl"=>"https://trello.com/b/sWfheMYx",
    "prefs"=>{
      "permissionLevel"=>"private",
      "hideVotes"=>false,
      "voting"=>"disabled",
      "comments"=>"members",
      "invitations"=>"members",
      "selfJoin"=>true,
      "cardCovers"=>true,
      "isTemplate"=>false,
      "cardAging"=>"regular",
      "calendarFeedEnabled"=>false,
      "background"=>"blue",
      "backgroundImage"=>nil,
      "backgroundImageScaled"=>nil,
      "backgroundTile"=>false,
      "backgroundBrightness"=>"dark",
      "backgroundColor"=>"#0079BF",
      "backgroundBottomColor"=>"#0079BF",
      "backgroundTopColor"=>"#0079BF",
      "canBePublic"=>true,
      "canBeEnterprise"=>true,
      "canBeOrg"=>true,
      "canBePrivate"=>true,
      "canInvite"=>true
    },
    "labelNames"=>{
      "green"=>"Sprint 1",
      "yellow"=>"",
      "orange"=>"",
      "red"=>"",
      "purple"=>"",
      "blue"=>"",
      "sky"=>"",
      "lime"=>"",
      "pink"=>"",
      "black"=>""
    }
  },
  "action"=>{
    "id"=>"5e6ab331862275121c1fa9b8",
    "idMemberCreator"=>"5e15f0988d06c5602566b8a4",
    "data"=>{
      "value"=>"green",
      "text"=>"Sprint 1",
      "card"=>{
        "id"=>"5e6aa6e4d1dc2b1cf4f1d853",
        "name"=>"This is a task",
        "idShort"=>2,
        "shortLink"=>"hfcQc8h0"
      },
      "board"=>{
        "id"=>"5e6aa5fc2d9c2815ece6c12a",
        "name"=>"Test",
        "shortLink"=>"sWfheMYx"
      },
      "label"=>{
        "id"=>"5e6aa5fd3f15f03f97a1a4fa",
        "name"=>"Sprint 1",
        "color"=>"green"
      }
    },
    "type"=>"addLabelToCard",
    "date"=>"2020-03-12T22:09:53.042Z",
    "limits"=>{},
    "display"=>{
      "translationKey"=>"action_add_label_to_card",
      "entities"=>{
        "label"=>{
          "type"=>"label",
          "color"=>"green",
          "text"=>"Sprint 1"
        },
        "card"=>{
          "type"=>"card",
          "id"=>"5e6aa6e4d1dc2b1cf4f1d853",
          "shortLink"=>"hfcQc8h0",
          "text"=>"This is a task"
        },
        "memberCreator"=>{
          "type"=>"member",
          "id"=>"5e15f0988d06c5602566b8a4",
          "username"=>"youennpriser1",
          "text"=>"Youenn PRISER"
        }
      }
    },
    "memberCreator"=>{
      "id"=>"5e15f0988d06c5602566b8a4",
      "activityBlocked"=>false,
      "avatarHash"=>"19134595ae40f2c5271054102acba78f",
      "avatarUrl"=>"https://trello-members.s3.amazonaws.com/5e15f0988d06c5602566b8a4/19134595ae40f2c5271054102acba78f",
      "fullName"=>"youenn.priser",
      "idMemberReferrer"=>nil,
      "initials"=>"Y",
      "nonPublic"=>{},
      "nonPublicAvailable"=>true,
      "username"=>"youennpriser1"
    }
  }
}
```

## Update Card
h = {"model"=>{"id"=>"5e69035202fc7b70ef88da61", "name"=>"test board", "desc"=>"", "descData"=>nil, "closed"=>false, "idOrganization"=>nil, "idEnterprise"=>nil, "pinned"=>false, "url"=>"https://trello.com/b/A0i2XL6S/test-board", "shortUrl"=>"https://trello.com/b/A0i2XL6S", "prefs"=>{"permissionLevel"=>"private", "hideVotes"=>false, "voting"=>"disabled", "comments"=>"members", "invitations"=>"members", "selfJoin"=>true, "cardCovers"=>true, "isTemplate"=>false, "cardAging"=>"regular", "calendarFeedEnabled"=>false, "background"=>"blue", "backgroundImage"=>nil, "backgroundImageScaled"=>nil, "backgroundTile"=>false, "backgroundBrightness"=>"dark", "backgroundColor"=>"#0079BF", "backgroundBottomColor"=>"#0079BF", "backgroundTopColor"=>"#0079BF", "canBePublic"=>true, "canBeEnterprise"=>true, "canBeOrg"=>true, "canBePrivate"=>true, "canInvite"=>true}, "labelNames"=>{"green"=>"", "yellow"=>"", "orange"=>"", "red"=>"", "purple"=>"", "blue"=>"", "sky"=>"", "lime"=>"", "pink"=>"", "black"=>""}}, "action"=>{"id"=>"5e6904863af4ed5a206fb353", "idMemberCreator"=>"5e15f0988d06c5602566b8a4", "data"=>{"old"=>{"idList"=>"5e690356e77a07361d33fc5a"}, "card"=>{"idList"=>"5e6903556194497a60ca05a6", "id"=>"5e6903caf89c13450d829e93", "name"=>"Test card webhoook", "idShort"=>1, "shortLink"=>"StoSU6vK"}, "board"=>{"id"=>"5e69035202fc7b70ef88da61", "name"=>"test board", "shortLink"=>"A0i2XL6S"}, "listBefore"=>{"id"=>"5e690356e77a07361d33fc5a", "name"=>"Sprint1"}, "listAfter"=>{"id"=>"5e6903556194497a60ca05a6", "name"=>"Sprint2"}}, "type"=>"updateCard", "date"=>"2020-03-11T15:32:22.198Z", "limits"=>{}, "display"=>{"translationKey"=>"action_move_card_from_list_to_list", "entities"=>{"card"=>{"type"=>"card", "idList"=>"5e6903556194497a60ca05a6", "id"=>"5e6903caf89c13450d829e93", "shortLink"=>"StoSU6vK", "text"=>"Test card webhoook"}, "listBefore"=>{"type"=>"list", "id"=>"5e690356e77a07361d33fc5a", "text"=>"Sprint1"}, "listAfter"=>{"type"=>"list", "id"=>"5e6903556194497a60ca05a6", "text"=>"Sprint2"}, "memberCreator"=>{"type"=>"member", "id"=>"5e15f0988d06c5602566b8a4", "username"=>"youennpriser1", "text"=>"Youenn PRISER"}}}, "memberCreator"=>{"id"=>"5e15f0988d06c5602566b8a4", "activityBlocked"=>false, "avatarHash"=>"19134595ae40f2c5271054102acba78f", "avatarUrl"=>"https://trello-members.s3.amazonaws.com/5e15f0988d06c5602566b8a4/19134595ae40f2c5271054102acba78f", "fullName"=>"youenn.priser", "idMemberReferrer"=>nil, "initials"=>"Y", "nonPublic"=>{}, "nonPublicAvailable"=>true, "username"=>"youennpriser1"}}}



## Card deletion

h = {"model"=>{"id"=>"5e69035202fc7b70ef88da61", "name"=>"test board", "desc"=>"", "descData"=>nil, "closed"=>false, "idOrganization"=>nil, "idEnterprise"=>nil, "pinned"=>false, "url"=>"https://trello.com/b/A0i2XL6S/test-board", "shortUrl"=>"https://trello.com/b/A0i2XL6S", "prefs"=>{"permissionLevel"=>"private", "hideVotes"=>false, "voting"=>"disabled", "comments"=>"members", "invitations"=>"members", "selfJoin"=>true, "cardCovers"=>true, "isTemplate"=>false, "cardAging"=>"regular", "calendarFeedEnabled"=>false, "background"=>"blue", "backgroundImage"=>nil, "backgroundImageScaled"=>nil, "backgroundTile"=>false, "backgroundBrightness"=>"dark", "backgroundColor"=>"#0079BF", "backgroundBottomColor"=>"#0079BF", "backgroundTopColor"=>"#0079BF", "canBePublic"=>true, "canBeEnterprise"=>true, "canBeOrg"=>true, "canBePrivate"=>true, "canInvite"=>true}, "labelNames"=>{"green"=>"", "yellow"=>"", "orange"=>"", "red"=>"", "purple"=>"", "blue"=>"", "sky"=>"", "lime"=>"", "pink"=>"", "black"=>""}}, "action"=>{"id"=>"5e690f3648c86084490dfc0b", "idMemberCreator"=>"5e15f0988d06c5602566b8a4", "data"=>{"card"=>{"id"=>"5e6903caf89c13450d829e93", "idShort"=>1, "shortLink"=>"StoSU6vK"}, "list"=>{"id"=>"5e6903556194497a60ca05a6", "name"=>"Sprint2"}, "board"=>{"id"=>"5e69035202fc7b70ef88da61", "name"=>"test board", "shortLink"=>"A0i2XL6S"}}, "type"=>"deleteCard", "date"=>"2020-03-11T16:17:58.698Z", "limits"=>{}, "display"=>{"translationKey"=>"action_delete_card", "entities"=>{"idCard"=>{"type"=>"text", "text"=>1}, "list"=>{"type"=>"list", "id"=>"5e6903556194497a60ca05a6", "text"=>"Sprint2"}, "memberCreator"=>{"type"=>"member", "id"=>"5e15f0988d06c5602566b8a4", "username"=>"youennpriser1", "text"=>"Youenn PRISER"}}}, "memberCreator"=>{"id"=>"5e15f0988d06c5602566b8a4", "activityBlocked"=>false, "avatarHash"=>"19134595ae40f2c5271054102acba78f", "avatarUrl"=>"https://trello-members.s3.amazonaws.com/5e15f0988d06c5602566b8a4/19134595ae40f2c5271054102acba78f", "fullName"=>"youenn.priser", "idMemberReferrer"=>nil, "initials"=>"Y", "nonPublic"=>{}, "nonPublicAvailable"=>true, "username"=>"youennpriser1"}}}



## Creating a card and attaching sth to it (2 different actions)
# Creation of a card "A" in the TO DO list
a = {"model"=>{"id"=>"5e6a4afd68bbb20a49595b43", "name"=>"Test Background job", "desc"=>"", "descData"=>nil, "closed"=>false, "idOrganization"=>nil, "idEnterprise"=>nil, "pinned"=>false, "url"=>"https://trello.com/b/nQbEzMrP/test-background-job", "shortUrl"=>"https://trello.com/b/nQbEzMrP", "prefs"=>{"permissionLevel"=>"private", "hideVotes"=>false, "voting"=>"disabled", "comments"=>"members", "invitations"=>"members", "selfJoin"=>true, "cardCovers"=>true, "isTemplate"=>false, "cardAging"=>"regular", "calendarFeedEnabled"=>false, "background"=>"blue", "backgroundImage"=>nil, "backgroundImageScaled"=>nil, "backgroundTile"=>false, "backgroundBrightness"=>"dark", "backgroundColor"=>"#0079BF", "backgroundBottomColor"=>"#0079BF", "backgroundTopColor"=>"#0079BF", "canBePublic"=>true, "canBeEnterprise"=>true, "canBeOrg"=>true, "canBePrivate"=>true, "canInvite"=>true}, "labelNames"=>{"green"=>"", "yellow"=>"Sprint 2", "orange"=>"", "red"=>"", "purple"=>"", "blue"=>"", "sky"=>"", "lime"=>"", "pink"=>"", "black"=>""}}, "action"=>{"id"=>"5e6a5569de269a86bc3cff01", "idMemberCreator"=>"5e15f0988d06c5602566b8a4", "data"=>{"card"=>{"id"=>"5e6a5569de269a86bc3cfefe", "name"=>"A", "idShort"=>5, "shortLink"=>"k3S8rnqZ"}, "list"=>{"id"=>"5e6a4aff2b90738a446a0df4", "name"=>"To Do"}, "board"=>{"id"=>"5e6a4afd68bbb20a49595b43", "name"=>"Test Background job", "shortLink"=>"nQbEzMrP"}}, "type"=>"createCard", "date"=>"2020-03-12T15:29:45.694Z", "limits"=>{}, "display"=>{"translationKey"=>"action_create_card", "entities"=>{"card"=>{"type"=>"card", "id"=>"5e6a5569de269a86bc3cfefe", "shortLink"=>"k3S8rnqZ", "text"=>"A"}, "list"=>{"type"=>"list", "id"=>"5e6a4aff2b90738a446a0df4", "text"=>"To Do"}, "memberCreator"=>{"type"=>"member", "id"=>"5e15f0988d06c5602566b8a4", "username"=>"youennpriser1", "text"=>"Youenn PRISER"}}}, "memberCreator"=>{"id"=>"5e15f0988d06c5602566b8a4", "activityBlocked"=>false, "avatarHash"=>"19134595ae40f2c5271054102acba78f", "avatarUrl"=>"https://trello-members.s3.amazonaws.com/5e15f0988d06c5602566b8a4/19134595ae40f2c5271054102acba78f", "fullName"=>"youenn.priser", "idMemberReferrer"=>nil, "initials"=>"Y", "nonPublic"=>{}, "nonPublicAvailable"=>true, "username"=>"youennpriser1"}}}

# Attachment of this same card to Test Webhook card in sprint 2

a_attached = {"model"=>{"id"=>"5e6a4afd68bbb20a49595b43", "name"=>"Test Background job", "desc"=>"", "descData"=>nil, "closed"=>false, "idOrganization"=>nil, "idEnterprise"=>nil, "pinned"=>false, "url"=>"https://trello.com/b/nQbEzMrP/test-background-job", "shortUrl"=>"https://trello.com/b/nQbEzMrP", "prefs"=>{"permissionLevel"=>"private", "hideVotes"=>false, "voting"=>"disabled", "comments"=>"members", "invitations"=>"members", "selfJoin"=>true, "cardCovers"=>true, "isTemplate"=>false, "cardAging"=>"regular", "calendarFeedEnabled"=>false, "background"=>"blue", "backgroundImage"=>nil, "backgroundImageScaled"=>nil, "backgroundTile"=>false, "backgroundBrightness"=>"dark", "backgroundColor"=>"#0079BF", "backgroundBottomColor"=>"#0079BF", "backgroundTopColor"=>"#0079BF", "canBePublic"=>true, "canBeEnterprise"=>true, "canBeOrg"=>true, "canBePrivate"=>true, "canInvite"=>true}, "labelNames"=>{"green"=>"", "yellow"=>"Sprint 2", "orange"=>"", "red"=>"", "purple"=>"", "blue"=>"", "sky"=>"", "lime"=>"", "pink"=>"", "black"=>""}}, "action"=>{"id"=>"5e6a55a107d1f518967a13f3", "idMemberCreator"=>"5e15f0988d06c5602566b8a4", "data"=>{"attachment"=>{"id"=>"5e6a55a107d1f518967a13f2", "name"=>"A", "url"=>"https://trello.com/c/5e6a5569de269a86bc3cfefe"}, "card"=>{"id"=>"5e6a4b2de4ef5b85044e1ba0", "name"=>"Test webhook", "idShort"=>1, "shortLink"=>"A4DGLHve"}, "list"=>{"id"=>"5e6a4b001ed7f562a78c74dd", "name"=>"Sprint 2"}, "board"=>{"id"=>"5e6a4afd68bbb20a49595b43", "name"=>"Test Background job", "shortLink"=>"nQbEzMrP"}}, "type"=>"addAttachmentToCard", "date"=>"2020-03-12T15:30:41.902Z", "limits"=>{}, "display"=>{"translationKey"=>"action_add_attachment_to_card", "entities"=>{"attachment"=>{"type"=>"attachment", "id"=>"5e6a55a107d1f518967a13f2", "link"=>true, "text"=>"A", "url"=>"https://trello.com/c/5e6a5569de269a86bc3cfefe"}, "attachmentPreview"=>{"type"=>"attachmentPreview", "id"=>"5e6a55a107d1f518967a13f2", "originalUrl"=>"https://trello.com/c/5e6a5569de269a86bc3cfefe"}, "card"=>{"type"=>"card", "id"=>"5e6a4b2de4ef5b85044e1ba0", "shortLink"=>"A4DGLHve", "text"=>"Test webhook"}, "memberCreator"=>{"type"=>"member", "id"=>"5e15f0988d06c5602566b8a4", "username"=>"youennpriser1", "text"=>"Youenn PRISER"}}}, "memberCreator"=>{"id"=>"5e15f0988d06c5602566b8a4", "activityBlocked"=>false, "avatarHash"=>"19134595ae40f2c5271054102acba78f", "avatarUrl"=>"https://trello-members.s3.amazonaws.com/5e15f0988d06c5602566b8a4/19134595ae40f2c5271054102acba78f", "fullName"=>"youenn.priser", "idMemberReferrer"=>nil, "initials"=>"Y", "nonPublic"=>{}, "nonPublicAvailable"=>true, "username"=>"youennpriser1"}}}

# Card "A" movement

a_movement =
# Card Test Webhook movement
p_movement =
