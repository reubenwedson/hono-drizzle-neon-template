ALTER TABLE "organization_user" RENAME COLUMN "group_id" TO "organization_id";--> statement-breakpoint
ALTER TABLE "organization_user" DROP CONSTRAINT "organization_user_group_id_organizations_id_fk";
--> statement-breakpoint
ALTER TABLE "organization_user" DROP CONSTRAINT "organization_user_user_id_group_id_pk";--> statement-breakpoint
ALTER TABLE "organization_user" ADD CONSTRAINT "organization_user_user_id_organization_id_pk" PRIMARY KEY("user_id","organization_id");--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "organization_user" ADD CONSTRAINT "organization_user_organization_id_organizations_id_fk" FOREIGN KEY ("organization_id") REFERENCES "organizations"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
