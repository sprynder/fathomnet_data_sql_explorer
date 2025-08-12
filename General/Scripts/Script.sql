CREATE TABLE images (
    uuid UUID PRIMARY KEY,
    url TEXT NOT NULL,
    valid BOOLEAN DEFAULT TRUE,
    imaging_type TEXT,
    depth_meters DOUBLE PRECISION,
    height INTEGER,
    last_validation TIMESTAMP,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    altitude DOUBLE PRECISION,
    salinity DOUBLE PRECISION,
    temperature_celsius DOUBLE PRECISION,
    oxygen_ml_l DOUBLE PRECISION,
    pressure_dbar DOUBLE PRECISION,
    media_type TEXT,
    modified TIMESTAMP,
    sha256 CHAR(64),
    contributors_email TEXT,
    timestamp TIMESTAMP,
    width INTEGER,
    created_timestamp TIMESTAMP,
    last_updated_timestamp TIMESTAMP
);


CREATE TABLE tags (
    uuid UUID PRIMARY KEY,
    key TEXT NOT NULL,
    media_type TEXT,
    value TEXT,
    created_timestamp TIMESTAMP,
    last_updated_timestamp TIMESTAMP,
    image TEXT,
    image_uuid UUID,
    CONSTRAINT fk_tag_image
        FOREIGN KEY (image_uuid)
        REFERENCES images(uuid)
        ON DELETE SET NULL
);

CREATE TABLE images (
    uuid UUID PRIMARY KEY,
    url TEXT NOT NULL,
    valid BOOLEAN DEFAULT TRUE,
    imaging_type TEXT,
    depth_meters DOUBLE PRECISION,
    height INTEGER,
    last_validation TIMESTAMP,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    altitude DOUBLE PRECISION,
    salinity DOUBLE PRECISION,
    temperature_celsius DOUBLE PRECISION,
    oxygen_ml_l DOUBLE PRECISION,
    pressure_dbar DOUBLE PRECISION,
    media_type TEXT,
    modified TIMESTAMP,
    sha256 CHAR(64),
    contributors_email TEXT,
    timestamp TIMESTAMP,
    width INTEGER,
    created_timestamp TIMESTAMP,
    last_updated_timestamp TIMESTAMP
);



CREATE TABLE BoundingBoxes (
    uuid UUID PRIMARY KEY,
    image_uuid UUID REFERENCES Images(uuid),
    id TEXT,
    user_defined_key TEXT,
    concept TEXT,
    alt_concept TEXT,
    image TEXT,
    group_of TEXT,
    height INTEGER,
    occluded TEXT,
    observer TEXT,
    truncated TEXT,
    width INTEGER,
    x INTEGER,
    y INTEGER,
    rejected BOOLEAN,
    verified BOOLEAN,
    verifier TEXT,
    verification_timestamp TIMESTAMP,
    created_timestamp TIMESTAMP,
    last_updated_timestamp TIMESTAMP
);

CREATE TYPE label AS ENUM ('benthic', 'midwater', 'unknown');

CREATE TYPE split_type AS ENUM ('train', 'test', 'val', 'other');


CREATE TABLE Labels (
    uuid UUID PRIMARY KEY,
    label label default 'unknown',
    url string

);


CREATE TABLE TotalImages (
    uuid UUID PRIMARY KEY,
    zone label,
    split split_type,
    url TEXT NOT NULL,
    valid BOOLEAN DEFAULT TRUE,
    imaging_type TEXT,
    depth_meters DOUBLE PRECISION,
    height INTEGER,
    last_validation TIMESTAMP,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    altitude DOUBLE PRECISION,
    salinity DOUBLE PRECISION,
    temperature_celsius DOUBLE PRECISION,
    oxygen_ml_l DOUBLE PRECISION,
    pressure_dbar DOUBLE PRECISION,
    media_type TEXT,
    modified TIMESTAMP,
    sha256 CHAR(64),
    contributors_email TEXT,
    timestamp TIMESTAMP,
    width INTEGER,
    created_timestamp TIMESTAMP,
    last_updated_timestamp TIMESTAMP
);

CREATE TABLE TotalBoundingBoxes (
    uuid UUID PRIMARY KEY,
    image_uuid UUID REFERENCES TotalImages(uuid),
    zone TEXT,
    supercategory TEXT,
    id TEXT,
    user_defined_key TEXT,
    concept TEXT,
    alt_concept TEXT,
    image TEXT,
    group_of TEXT,
    height INTEGER,
    occluded TEXT,
    observer TEXT,
    truncated TEXT,
    width INTEGER,
    x INTEGER,
    y INTEGER,
    rejected BOOLEAN,
    verified BOOLEAN,
    verifier TEXT,
    verification_timestamp TIMESTAMP,
    created_timestamp TIMESTAMP,
    last_updated_timestamp TIMESTAMP
);






CREATE TABLE CompleteImages (
    uuid UUID PRIMARY KEY,
    url TEXT NOT NULL,
    valid BOOLEAN DEFAULT TRUE,
    imaging_type TEXT,
    depth_meters DOUBLE PRECISION,
    height INTEGER,
    last_validation TIMESTAMP,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    altitude DOUBLE PRECISION,
    salinity DOUBLE PRECISION,
    temperature_celsius DOUBLE PRECISION,
    oxygen_ml_l DOUBLE PRECISION,
    pressure_dbar DOUBLE PRECISION,
    media_type TEXT,
    modified TIMESTAMP,
    sha256 CHAR(64),
    contributors_email TEXT,
    timestamp TIMESTAMP,
    width INTEGER,
    created_timestamp TIMESTAMP,
    last_updated_timestamp TIMESTAMP
);



CREATE TABLE CompleteBoundingBoxes (
    uuid UUID PRIMARY KEY,
    image_uuid UUID REFERENCES CompleteImages(uuid),
    id TEXT,
    user_defined_key TEXT,
    concept TEXT,
    alt_concept TEXT,
    image TEXT,
    group_of TEXT,
    height INTEGER,
    occluded TEXT,
    observer TEXT,
    truncated TEXT,
    width INTEGER,
    x INTEGER,
    y INTEGER,
    rejected BOOLEAN,
    verified BOOLEAN,
    verifier TEXT,
    verification_timestamp TIMESTAMP,
    created_timestamp TIMESTAMP,
    last_updated_timestamp TIMESTAMP
);

CREATE TYPE label AS ENUM ('benthic', 'midwater', 'unknown');

CREATE TYPE split_type AS ENUM ('train', 'test', 'val', 'other');


CREATE TABLE CompleteLabels (
    uuid UUID PRIMARY key REFERENCES CompleteImages(uuid),
    label label default 'unknown');