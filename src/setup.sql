CREATE TABLE organization (
organization_id SERIAL PRIMARY KEY,
name VARCHAR(150) NOT NULL,
description TEXT NOT NULL,
contact_email VARCHAR (255) NOT NULL,
logo_filename VARCHAR (255) NOT NULL
);


INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES ('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png');

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES ('GreenHarvest Growers', 'An urban collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png');

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES ('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives', 'hello@unityserve.org', 'unityserve-logo.png');


CREATE TABLE service_project (
    project_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    date DATE NOT NULL,
    organization_id INT NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES organization(organization_id)
);


INSERT INTO service_project (title, description, date, organization_id)
VALUES
('Park Cleanup', 'Join us to clean up local parks and make them beautiful.', '2026-09-15', 1),
('Community Garden Build', 'Help build and improve a sustainable community garden.', '2026-09-20', 1),
('Neighborhood Repairs', 'Assist with small construction and repair projects in the community.', '2026-09-25', 1),
('Recycling Center Improvement', 'Help improve and organize a local recycling center.', '2026-10-03', 1),
('Community Playground Project', 'Help repair and improve a playground for local children.', '2026-10-10', 1);

INSERT INTO service_project (title, description, date, organization_id)
VALUES
('Community Food Drive', 'Help collect and distribute food to families in need.', '2026-09-18', 2),
('Urban Garden Workshop', 'Teach community members how to grow food in small urban spaces.', '2026-09-24', 2),
('Neighborhood Tree Planting', 'Help plant trees and improve green spaces in the neighborhood.', '2026-10-01', 2),
('Composting Project', 'Help residents learn how to compost household food waste.', '2026-10-08', 2),
('Local Farmers Market Support', 'Help organize and support a local farmers market.', '2026-10-15', 2);

INSERT INTO service_project (title, description, date, organization_id)
VALUES
('Volunteer Food Distribution', 'Help distribute meals and essential supplies to local families.', '2026-09-22', 3),
('Senior Center Assistance', 'Spend time helping with activities and services at a local senior center.', '2026-09-29', 3),
('Community Clothing Drive', 'Collect, organize, and distribute clothing to people in need.', '2026-10-06', 3),
('Youth Activity Day', 'Help organize educational and recreational activities for local youth.', '2026-10-13', 3),
('Neighborhood Charity Event', 'Assist with a community event that supports local charitable organizations.', '2026-10-20', 3);


CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);
INSERT INTO category (name)
VALUES
('Environmental'),
('Educational'),
('Community Service'),
('Health and Wellness');

CREATE TABLE project_category (
    project_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (project_id, category_id),
    FOREIGN KEY (project_id) REFERENCES service_project(project_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

INSERT INTO project_category (project_id, category_id)
VALUES
(1, 1),
(2, 1),
(3, 3),
(4, 1),
(5, 3),
(6, 3),
(7, 2),
(8, 1),
(9, 1),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 2),
(15, 3);