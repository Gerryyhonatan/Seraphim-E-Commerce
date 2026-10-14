from app.database_helpers import execute, fetch_one

async def create_refresh_token(hashed_token, user_id, expired_at):
      return await execute(
            """
            INSERT INTO refresh_tokens (refresh_token_code, refresh_token_user_id, refresh_token_expired_at)
            VALUES ($1, $2, $3)
            """,
            hashed_token, user_id, expired_at
      )

async def get_refresh_token(hashed_token):
      return await fetch_one(
        """
        SELECT refresh_token_id, refresh_token_user_id, refresh_token_expired_at, refresh_token_revoked_at
        FROM refresh_tokens
        WHERE refresh_token_code = $1
        """,
        hashed_token
      )

async def revoke_refresh_token(revoked_at, refresh_token_id):
      return await execute(
        "UPDATE refresh_tokens SET refresh_token_revoked_at = $1 WHERE refresh_token_id = $2",
        revoked_at, refresh_token_id
      )

