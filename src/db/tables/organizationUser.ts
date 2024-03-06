import { pgTable, primaryKey, uuid } from "drizzle-orm/pg-core";
import { organizations } from "./organizations";
import { users } from "./users";

export const organizationUser = pgTable('organization_user', {
      userId: uuid('user_id').notNull().references(() => users.id),
      organizationId: uuid('group_id').notNull().references(() => organizations.id),
}, (t) => ({
      pk: primaryKey(t.userId, t.organizationId),
}),
);
