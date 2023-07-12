// To parse this JSON data, do
//
//     final adventureModel = adventureModelFromJson(jsonString);

import 'dart:convert';

AdventureModel adventureModelFromJson(String str) => AdventureModel.fromJson(json.decode(str));


class AdventureModel {
    int? count;
    String? next;
    dynamic previous;
    List<Adventures>? data;

    AdventureModel({
        this.count,
        this.next,
        this.previous,
        this.data,
    });

    factory AdventureModel.fromJson(Map<String, dynamic> json) => AdventureModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        data: json["data"] == null ? [] : List<Adventures>.from(json["data"] .map((x) => Adventures.fromJson(x))),
    );

  
}

class Adventures {
    int? id;
    int? pk;
    Status? status;
    String? title;
    Location? areaLocation;
    Location? startingLocation;
    List<String>? tags;
    Activity? activity;
    int? activityId;
    String? primaryImage;
    String? primaryVideo;
    String? thumbnail;
    String? activityIcon;
    List<Badge>? badges;
    int? bucketListCount;
    List<Content>? contents;
    SupplyInfo? supplyInfo;
    List<GridInfo>? gridInfo;
    bool? ticketOptional;
    List<dynamic>? bookedByFollowing;
    String? primaryDescription;
    String? description;
    List<Fact>? facts;

    Adventures({
        this.id,
        this.pk,
        this.status,
        this.title,
        this.areaLocation,
        this.startingLocation,
        this.tags,
        this.activity,
        this.activityId,
        this.primaryImage,
        this.primaryVideo,
        this.thumbnail,
        this.activityIcon,
        this.badges,
        this.bucketListCount,
        this.contents,
        this.supplyInfo,
        this.gridInfo,
        this.ticketOptional,
        this.bookedByFollowing,
        this.primaryDescription,
        this.description,
        this.facts,
    });

    factory Adventures.fromJson(Map<String, dynamic> json) => Adventures(
        id: json["id"],
        pk: json["pk"],
        status: statusValues.map[json["status"]] ,
        title: json["title"],
        areaLocation: json["area_location"] == null ? null : Location.fromJson(json["area_location"]),
        startingLocation: json["starting_location"] == null ? null : Location.fromJson(json["starting_location"]),
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"] .map((x) => x)),
        activity: activityValues.map[json["activity"]] ,
        activityId: json["activity_id"],
        primaryImage: json["primary_image"],
        primaryVideo: json["primary_video"],
        thumbnail: json["thumbnail"],
        activityIcon: json["activity_icon"],
        badges: json["badges"] == null ? [] : List<Badge>.from(json["badges"] .map((x) => Badge.fromJson(x))),
        bucketListCount: json["bucket_list_count"],
        contents: json["contents"] == null ? [] : List<Content>.from(json["contents"] .map((x) => Content.fromJson(x))),
        supplyInfo: json["supply_info"] == null ? null : SupplyInfo.fromJson(json["supply_info"]),
        gridInfo: json["grid_info"] == null ? [] : List<GridInfo>.from(json["grid_info"] .map((x) => GridInfo.fromJson(x))),
        ticketOptional: json["ticket_optional"],
        bookedByFollowing: json["booked_by_following"] == null ? [] : List<dynamic>.from(json["booked_by_following"] .map((x) => x)),
        primaryDescription: json["primary_description"],
        description: json["description"],
        facts: json["facts"] == null ? [] : List<Fact>.from(json["facts"] .map((x) => Fact.fromJson(x))),
    );

  
}

enum Activity { HIKING, VIA_FERRATA, TOBOGGANING }

final activityValues = EnumValues({
    "Hiking": Activity.HIKING,
    "Tobogganing": Activity.TOBOGGANING,
    "Via Ferrata": Activity.VIA_FERRATA
});

class Location {
    String? name;
    dynamic subtitle;
    dynamic distance;
    String? imageUrl;

    Location({
        this.name,
        this.subtitle,
        this.distance,
        this.imageUrl,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        subtitle: json["subtitle"],
        distance: json["distance"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "subtitle": subtitle,
        "distance": distance,
        "image_url": imageUrl,
    };
}

class Badge {
    String? title;
    String? icon;
    String? colorScheme;

    Badge({
        this.title,
        this.icon,
        this.colorScheme,
    });

    factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        title: json["title"],
        icon: json["icon"],
        colorScheme: json["color_scheme"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "icon": icon,
        "color_scheme": colorScheme,
    };
}

class Content {
    String? id;
    ContentType? contentType;
    ContentMode? contentMode;
    String? contentUrl;
    ContentSource? contentSource;
    bool? isHeaderForThePlan;
    bool? isPrivate;

    Content({
        this.id,
        this.contentType,
        this.contentMode,
        this.contentUrl,
        this.contentSource,
        this.isHeaderForThePlan,
        this.isPrivate,
    });

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        contentType: contentTypeValues.map[json["content_type"]] ,
        contentMode: contentModeValues.map[json["content_mode"]] ,
        contentUrl: json["content_url"],
        contentSource: json["content_source"] == null ? null : ContentSource.fromJson(json["content_source"]),
        isHeaderForThePlan: json["is_header_for_the_plan"],
        isPrivate: json["is_private"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "content_type": contentTypeValues.reverse[contentType],
        "content_mode": contentModeValues.reverse[contentMode],
        "content_url": contentUrl,
        "content_source": contentSource?.toJson(),
        "is_header_for_the_plan": isHeaderForThePlan,
        "is_private": isPrivate,
    };
}

enum ContentMode { ADVENTURE_PRIMARY_IMAGE, ADVENTURE_GALLERY, ADVENTURE_PRIMARY_VIDEO, ADVENTURE_STATIC_MAP }

final contentModeValues = EnumValues({
    "ADVENTURE_GALLERY": ContentMode.ADVENTURE_GALLERY,
    "ADVENTURE_PRIMARY_IMAGE": ContentMode.ADVENTURE_PRIMARY_IMAGE,
    "ADVENTURE_PRIMARY_VIDEO": ContentMode.ADVENTURE_PRIMARY_VIDEO,
    "ADVENTURE_STATIC_MAP": ContentMode.ADVENTURE_STATIC_MAP
});

class ContentSource {
    String? id;
    Title? title;
    Author? author;
    Author? name;
    dynamic icon;
    dynamic url;
    dynamic creator;

    ContentSource({
        this.id,
        this.title,
        this.author,
        this.name,
        this.icon,
        this.url,
        this.creator,
    });

    factory ContentSource.fromJson(Map<String, dynamic> json) => ContentSource(
        id: json["id"],
        title: titleValues.map[json["title"]] ,
        author: authorValues.map[json["author"]] ,
        name: authorValues.map[json["name"]] ,
        icon: json["icon"],
        url: json["url"],
        creator: json["creator"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
        "author": authorValues.reverse[author],
        "name": authorValues.reverse[name],
        "icon": icon,
        "url": url,
        "creator": creator,
    };
}

enum Author { MIKE_KAUFMANN, JOCHEN_IHLE, DOMINIK_SCHITTNY, MELANIE_STUDER }

final authorValues = EnumValues({
    "Dominik Schittny": Author.DOMINIK_SCHITTNY,
    "Jochen Ihle": Author.JOCHEN_IHLE,
    "Melanie Studer": Author.MELANIE_STUDER,
    "Mike Kaufmann": Author.MIKE_KAUFMANN
});

enum Title { BERNER_WANDERWEGE, INTERLAKEN_TOURISMUS, TOURENPLANER_SCHWEIZ, COMMUNITY, WANDERMAGAZIN }

final titleValues = EnumValues({
    "Berner Wanderwege": Title.BERNER_WANDERWEGE,
    "Community": Title.COMMUNITY,
    "Interlaken Tourismus": Title.INTERLAKEN_TOURISMUS,
    "Tourenplaner SCHWEIZ": Title.TOURENPLANER_SCHWEIZ,
    "Wandermagazin": Title.WANDERMAGAZIN
});

enum ContentType { IMAGE, VIDEO }

final contentTypeValues = EnumValues({
    "IMAGE": ContentType.IMAGE,
    "VIDEO": ContentType.VIDEO
});

class Fact {
    String? name;
    String? value;
    String? unit;
    String? iconUrl;
    String? displaySection;
    int? factDefinitionId;
    int? adventureFactId;
    dynamic backgroundColor;
    dynamic iconColor;
    dynamic textColor;

    Fact({
        this.name,
        this.value,
        this.unit,
        this.iconUrl,
        this.displaySection,
        this.factDefinitionId,
        this.adventureFactId,
        this.backgroundColor,
        this.iconColor,
        this.textColor,
    });

    factory Fact.fromJson(Map<String, dynamic> json) => Fact(
        name: json["name"],
        value: json["value"],
        unit: json["unit"],
        iconUrl: json["icon_url"],
        displaySection: json["display_section"],
        factDefinitionId: json["fact_definition_id"],
        adventureFactId: json["adventure_fact_id"],
        backgroundColor: json["background_color"],
        iconColor: json["icon_color"],
        textColor: json["text_color"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "unit": unit,
        "icon_url": iconUrl,
        "display_section": displaySection,
        "fact_definition_id": factDefinitionId,
        "adventure_fact_id": adventureFactId,
        "background_color": backgroundColor,
        "icon_color": iconColor,
        "text_color": textColor,
    };
}

class GridInfo {
    Name? name;
    String? value;
    String? iconUrl;
    String? schema;

    GridInfo({
        this.name,
        this.value,
        this.iconUrl,
        this.schema,
    });

    factory GridInfo.fromJson(Map<String, dynamic> json) => GridInfo(
        name: nameValues.map[json["name"]] ,
        value: json["value"],
        iconUrl: json["icon_url"],
        schema: json["schema"],
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "value": value,
        "icon_url": iconUrl,
        "schema": schema,
    };
}

enum Name { DIFFICULTY, DURATION, DISTANCE, ASCENT, DESCENT }

final nameValues = EnumValues({
    "ascent": Name.ASCENT,
    "descent": Name.DESCENT,
    "difficulty": Name.DIFFICULTY,
    "distance": Name.DISTANCE,
    "duration": Name.DURATION
});

enum Status { LIVE }

final statusValues = EnumValues({
    "live": Status.LIVE
});

class SupplyInfo {
    String? supplierName;
    PriceTitle? priceTitle;
    String? priceSubtitle;
    ButtonType? buttonType;
    dynamic link;

    SupplyInfo({
        this.supplierName,
        this.priceTitle,
        this.priceSubtitle,
        this.buttonType,
        this.link,
    });

    factory SupplyInfo.fromJson(Map<String, dynamic> json) => SupplyInfo(
        supplierName: json["supplier_name"],
        priceTitle: priceTitleValues.map[json["price_title"]] ,
        priceSubtitle: json["price_subtitle"],
        buttonType: buttonTypeValues.map[json["button_type"]] ,
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "supplier_name": supplierName,
        "price_title": priceTitleValues.reverse[priceTitle],
        "price_subtitle": priceSubtitle,
        "button_type": buttonTypeValues.reverse[buttonType],
        "link": link,
    };
}

enum ButtonType { SHARE, HYLL }

final buttonTypeValues = EnumValues({
    "hyll": ButtonType.HYLL,
    "share": ButtonType.SHARE
});

enum PriceTitle { FREE, EMPTY }

final priceTitleValues = EnumValues({
    "": PriceTitle.EMPTY,
    "Free": PriceTitle.FREE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
