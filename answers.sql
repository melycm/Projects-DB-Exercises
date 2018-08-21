-- 1) What are all projects that use JavaScript?
-- SELECT * FROM project_uses_tech
--   WHERE tech_id = 3;

-- 2) What are all technologies used by the Personal Website?
-- SELECT * FROM project_uses_tech
--     WHERE project_id = 4;

-- 3) Perform a left outer join from the tech table to the project_uses_tech table - which techs has no associated project?
-- SELECT * FROM tech
--     LEFT OUTER JOIN project_uses_tech
--     ON tech.id = project_uses_tech.tech_id
--     WHERE tech_id is NULL;

-- 4) Based on the previous query, get the count of the number of techs used by each project.
-- SELECT count(tech.name) FROM tech
--     LEFT OUTER JOIN project_uses_tech
--     ON tech.id = project_uses_tech.tech_id;

-- 5) Perform a left outer join from the project table to the project_users_tech table - which projects has no associated tech?
-- SELECT * FROM project
--     LEFT OUTER JOIN project_uses_tech
--     ON project.id = project_uses_tech.project_id
--     WHERE project_id is NULL;

-- 6) Based on the previous query, get the count of the number of projects that use each tech.
-- SELECT count(project.id) FROM project
--     LEFT OUTER JOIN project_uses_tech
--     ON project.id = project_uses_tech.project_id;

-- 7) List all projects along with each technology used by it. You will need to do a three-way join.
-- SELECT * FROM project
--     JOIN tech ON tech.id = project.id
--     JOIN project_uses_tech ON project_uses_tech.tech_id = tech.id;

-- 8) List all the distinct techs that are used by at least one project.
-- SELECT distinct(tech.name) from project
--     INNER JOIN project_uses_tech ON project_uses_tech.project_id = project_id
--     INNER JOIN tech ON project_uses_tech.tech_id = tech.id;

-- 9) List all the distinct techs that are not used by any projects.
-- SELECT distinct(tech.name) FROM project
--     RIGHT OUTER JOIN project_uses_tech ON project_uses_tech.project_id = project.id
--     RIGHT OUTER JOIN tech ON project_uses_tech.tech_id = tech.id
--     WHERE project_id is NULL;

-- 10) List all the distinct projects that use at least one tech.
-- SELECT distinct(project.name) from tech
--     INNER JOIN project_uses_tech ON project_uses_tech.tech_id = tech_id
--     INNER JOIN project ON project_uses_tech.project_id = project.id;

-- 11) List all the distinct projects that use no tech.
-- SELECT distinct(project.name) FROM tech
--     RIGHT OUTER JOIN project_uses_tech ON project_uses_tech.tech_id = tech.id
--     RIGHT OUTER JOIN project ON project_uses_tech.project_id = project.id
--     WHERE tech_id is NULL;

-- 12) Order the projects by how many tech it uses.
-- SELECT project.name, count(project_uses_tech.tech_id) FROM project
--     LEFT OUTER JOIN project_uses_tech ON project_uses_tech.project_id = project.id
--     GROUP BY project.id ORDER BY count;

-- 13) Order the tech by how many projects use it.
-- SELECT tech.name, count(project_uses_tech.project_id) FROM tech
--     LEFT OUTER JOIN project_uses_tech ON project_uses_tech.tech_id = tech.id
--     GROUP BY tech.id ORDER BY count;

-- 14) What is the average number of techs used by a project?
-- SELECT AVG(count) FROM (
-- SELECT tech.name, count(project_uses_tech.project_id) FROM tech
--     INNER JOIN project_uses_tech ON project_uses_tech.tech_id = tech.id
--     GROUP BY tech.id) as count;